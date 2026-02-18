import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:merova/src/core/interceptors/language_interceptor.dart';
import 'package:merova/src/core/service/api/api_config.dart';
import 'package:merova/src/core/storage/secure_storage.dart';
import '../../interceptors/auth_interceptor.dart';
import '../../interceptors/logging_interceptor.dart';
import '../../interceptors/retry_interceptor.dart';
import '../responses/timeout_config.dart';


class DioClient {
  /// Creates a configured Dio instance.
  ///
  /// Requires a [storage] to provide auth token and a [locale] for language header.
  /// You may pass additional [customInterceptors] which will be appended after defaults.
  static Dio create({
    required SecureStorage storage,
    required Locale locale,
    List<Interceptor>? customInterceptors,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: TimeoutConfig.connect,
        receiveTimeout: TimeoutConfig.receive,
        sendTimeout: TimeoutConfig.send,
      ),
    );

    final defaultInterceptors = <Interceptor>[
      AuthInterceptor(storage),
      LanguageInterceptor(locale),
      RetryInterceptor(dio: dio),
      LoggingInterceptor(),
    ];

    dio.interceptors.addAll(defaultInterceptors);

    if (customInterceptors != null && customInterceptors.isNotEmpty) {
      dio.interceptors.addAll(customInterceptors);
    }

    return dio;
  }
}