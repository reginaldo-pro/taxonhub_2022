// ignore_for_file: depend_on_referenced_packages, avoid_web_libraries_in_flutter

import 'dart:convert';
import 'dart:html' as html;
import 'package:bloc/bloc.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front_end/models/occurrence_search/occurrence.dart';
import 'package:front_end/models/taxonomic_search/taxonomic.dart';
import 'package:front_end/services/ocurrence_search.dart';
import 'package:front_end/services/request/request_handler.dart';
import 'package:front_end/services/taxonomic_search.dart';
import 'package:front_end/utils/enums.dart';
import 'package:front_end/utils/errors/capture_default_errors.dart';

part 'searchs_event.dart';
part 'searchs_state.dart';
part 'searchs_bloc.freezed.dart';

class SearchsBloc extends Bloc<SearchsEvent, SearchsState> {
  PlatformFile? file;
  SearchType? searchType;

  SearchsBloc() : super(const _Initial()) {
    on<SearchsEvent>((event, emit) {});

    on<_Init>((event, emit) {
      searchType = event.searchType;
      emit(const _Loading());
      if (file != null) {
        emit(_Imported(file!));
      } else {
        emit(const _Initial());
      }
    });

    on<_Import>((event, emit) async {
      emit(const _Loading());
      emit(const _Initial());

      try {
        var result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          withData: true,
          allowMultiple: false,
          allowedExtensions: ['csv'],
        );

        if (result != null) {
          file = result.files.first;
          emit(_Imported(file!));
        } else {
          throw Error();
        }
      } on DefaultErrors catch (err) {
        emit(_Error(err));
      }
    });

    on<_Search>((event, emit) async {
      emit(const _Loading());

      try {
        final requestHandler = RequestHandler.instance;

        if (searchType == SearchType.occurrence) {
          final occurrenciesList =
              await OcurrenceSearchService(requestHandler: requestHandler)
                  .postOcurrenceSearch(
            file: event.file,
          );
          emit(
            _Success(
              occurrenciesList: occurrenciesList,
              taxonomicsList: null,
              fileName: file!.name,
              searchType: SearchType.occurrence,
            ),
          );
        } else {
          final taxonomicsList =
              await TaxonomicSearchService(requestHandler: requestHandler)
                  .postTaxonomicSearch(
            file: event.file,
          );
          emit(_Success(
              taxonomicsList: taxonomicsList,
              occurrenciesList: null,
              fileName: file!.name,
              searchType: SearchType.taxonomic));
        }
      } on DefaultErrors catch (err) {
        emit(_Error(err));
      }
    });

    on<_Export>((event, emit) {
      emit(const _Loading());

      try {
        var data = <List<String>>[];

        if (searchType == SearchType.occurrence) {
          data = <List<String>>[
            [
              'Scientific Name',
              'Database',
              'Family',
              'Country',
              'Year',
              'Month',
              'Day',
              'Lat',
              'Long',
            ],
          ];

          data.addAll(event.occurrenciesList!.map<List<String>>(
            (item) {
              final occurrenceRow = [
                item.scientificName.toString(),
                item.database.toString(),
                item.family.toString(),
                item.country.toString(),
                item.year.toString(),
                item.month.toString(),
                item.day.toString(),
                item.lat.toString(),
                item.long.toString(),
              ];
              return occurrenceRow;
            },
          ).toList());
        } else {
          data = <List<String>>[
            [
              'id',
              'Nome pesquisado',
              'Nomes retornados',
              'Nome aceito/sinonimo',
              'Sinonimo de',
              'Base de dados (FDB/TPL)',
              'FamÃ­lia respectiva da base de dados',
              'Autor',
              'Encontrado'
            ],
          ];

          data.addAll(event.taxonomicsList!.map<List<String>>(
            (item) {
              final taxonomicRow = [
                item.id.toString(),
                item.searchedSpeciesName.toString(),
                item.returnedNames.toString(),
                null.toString(),
                item.synonymOf.toString(),
                item.database.toString(),
                item.respectiveFamily.toString(),
                item.autor.toString(),
                item.found.toString(),
              ];
              return taxonomicRow;
            },
          ).toList());
        }

        String csvData = const ListToCsvConverter().convert(data);

        html.AnchorElement()
          ..href =
              '${Uri.dataFromString(csvData, mimeType: 'text/csv', encoding: utf8)}'
          ..download = event.fileName
          ..style.display = 'none'
          ..click();

        emit(const _Empty());
      } on DefaultErrors catch (err) {
        emit(_Error(err));
      }
    });

    on<_Alert>((event, emit) {
      emit(const _Loading());
      emit(const _Warning());
    });

    on<_Reset>((event, emit) {
      file = null;
      searchType = null;
      emit(const _Empty());
    });
  }
}