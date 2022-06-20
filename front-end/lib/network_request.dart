import 'package:dio/dio.dart';

class NetworkRequest {
  // ignore: unused_field
  late final Dio? _dio;

  static const baseUrl = 'http://127.0.0.1:3333/';

  Dio get dio {
    return Dio(BaseOptions(baseUrl: baseUrl))
      ..options.baseUrl = baseUrl
      ..interceptors.add(CustomInterceptors());
  }
}

/// Instance of the [NetworkRequest] class that is used every
/// time we need this class in the app
NetworkRequest networkRequest() => NetworkRequest();

/// Customization of dio interceptors
class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return super.onError(err, handler);
  }
}
