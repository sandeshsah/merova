import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:merova/src/core/environment/app_environment.dart';
import 'package:merova/src/core/interceptors/custom_interceptor.dart';
import 'package:merova/src/core/helper/token_storage.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import '../../interceptors/logging_interceptor.dart';
import '../../interceptors/retry_interceptor.dart';
import '../responses/timeout_config.dart';

class DioClient {
  static Dio create({
    required TokenStorage storage,
    required Locale locale,
    List<Interceptor>? customInterceptors,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppEnvironment.baseUrl,
        connectTimeout: TimeoutConfig.connect,
        receiveTimeout: TimeoutConfig.receive,
        sendTimeout: TimeoutConfig.send,
      ),
    );

    final defaultInterceptors = <Interceptor>[
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
      // consolidated CustomInterceptor replaces Auth and Language interceptors
      CustomInterceptor(dio: dio, storage: storage, locale: locale),
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
