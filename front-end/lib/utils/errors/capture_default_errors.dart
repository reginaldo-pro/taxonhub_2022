import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front_end/utils/extensions.dart';

enum DefaultErrors {
  badRequest,
  unauthorizedAccess,
  forbidden,
  notFound,
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

extension MessageError on DefaultErrors {
  String defaultErrortoString(BuildContext context) {
    switch (this) {
      case DefaultErrors.badRequest:
        return context.T.msgErrorBadRequest;
      case DefaultErrors.connectionError:
        return context.T.msgErrorNotFound;
      case DefaultErrors.forbidden:
        return context.T.msgErrorConnectionError;
      case DefaultErrors.notFound:
        return context.T.msgErrorForbidden;
      case DefaultErrors.unauthorizedAccess:
        return context.T.msgErrorUnauthorizedAccess;
      case DefaultErrors.unexpectedError:
        return context.T.msgErrorUnexpectedError;
      default:
        return context.T.msgErrorUnexpectedError;
    }
  }
}
