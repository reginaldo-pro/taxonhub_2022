import 'package:dio/dio.dart';
import 'package:front_end/network_request.dart';
import 'package:front_end/utils/errors/capture_default_errors.dart';

class RequestHandler {
  RequestHandler._();
  static final RequestHandler instance = RequestHandler._();

  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await networkRequest()
          .dio
          .get<dynamic>(url, queryParameters: queryParameters);

      if (response.data != null) {
        return response.data!;
      }
      throw DefaultErrors.unexpectedError;
    } catch (e) {
      throw CaptureDefaultErrors.throwDefaultErrors(e);
    }
  }

  Future<Map<String, dynamic>> post(
    String url, {
    required dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await networkRequest().dio.post<Map<String, dynamic>>(
            url,
            data: body,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );

      if (response.data != null && response.data is Map<String, dynamic>) {
        return response.data!;
      }

      throw DefaultErrors.unexpectedError;
    } catch (e) {
      throw CaptureDefaultErrors.throwDefaultErrors(e);
    }
  }
}
