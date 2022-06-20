import 'package:dio/dio.dart';

enum DefaultErrors {
  badRequest,
  unauthorizedAccess,
  forbidden,
  notFound,
  preconditionFailed,
  connectionError,
  unexpectedError,
}

class CaptureDefaultErrors {
  CaptureDefaultErrors._();

  static Object throwDefaultErrors(Object exception) {
    if (exception is DioError && exception.response != null) {
      switch (exception.response!.statusCode) {
        case 400:
          return DefaultErrors.badRequest;
        case 401:
          return DefaultErrors.unauthorizedAccess;
        case 403:
          return DefaultErrors.forbidden;
        case 404:
          return DefaultErrors.notFound;
        case 500:
          return DefaultErrors.connectionError;
        default:
          return exception;
      }
    } else {
      return DefaultErrors.unexpectedError;
    }
  }
}
