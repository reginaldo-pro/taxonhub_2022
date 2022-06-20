import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:front_end/models/taxonomic_search/taxonomic.dart';
import 'package:front_end/utils/errors/capture_default_errors.dart';
import 'package:front_end/utils/errors/capture_errors.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:front_end/services/request/request_handler.dart';

class TaxonomicSearchService {
  const TaxonomicSearchService({
    required this.requestHandler,
  });

  final RequestHandler requestHandler;

  Future<List<Taxonomic>> postTaxonomicSearch({
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
        'busca-taxonomica',
        body: queryParameters,
      );

      final taxonomics = (request['data'] as List<dynamic>)
          .map((dynamic taxonomic) =>
              Taxonomic.fromMap(taxonomic as Map<String, dynamic>))
          .toList();

      return taxonomics;
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
