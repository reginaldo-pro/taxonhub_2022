// ignore_for_file: depend_on_referenced_packages, avoid_web_libraries_in_flutter

import 'package:bloc/bloc.dart';
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

        emit(const _Loading());

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
      emit(const _Empty());
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
