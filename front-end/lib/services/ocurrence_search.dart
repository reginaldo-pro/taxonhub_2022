import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:front_end/models/occurrence_search/occurrence.dart';
import 'package:front_end/utils/errors/capture_default_errors.dart';
import 'package:front_end/utils/errors/capture_errors.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:front_end/services/request/request_handler.dart';

class OcurrenceSearchService {
  const OcurrenceSearchService({
    required this.requestHandler,
  });

  final RequestHandler requestHandler;

  Future<List<Occurrence>> postOcurrenceSearch({
    required PlatformFile file,
  }) async {
    try {
      final FormData queryParameters = FormData.fromMap(
        <String, dynamic>{
          'filecsv': MultipartFile.fromBytes(
            file.bytes!,
            filename: file.name,
            contentType: MediaType('text', 'csv'),
          ),
        },
      );

      final request = await requestHandler.post(
        'busca-ocorrencia',
        body: queryParameters,
      );

      final occurrence = (request['data'] as List<dynamic>)
          .map((dynamic occurrence) =>
              Occurrence.fromMap(occurrence as Map<String, dynamic>))
          .toList();

      return occurrence;
    } catch (e) {
      if (e is TypeError) {
        throw DefaultErrors.unexpectedError;
      }
      if (e is DioError) {
        throw CaptureErrors.throwCodeErrors(
          e.response!.data as Map<String, dynamic>,
        );
      }
      rethrow;
    }
  }
}
