import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int retryCount;

  RetryInterceptor({
    required this.dio,
    this.retryCount = 3,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      var attempt = 0;

      while (attempt < retryCount) {
        attempt++;

        try {
          final response = await dio.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (_) {}
      }
    }

    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
      return err.type == DioExceptionType.connectionTimeout ||
            err.type == DioExceptionType.sendTimeout ||
            err.type == DioExceptionType.receiveTimeout;
  }
}
