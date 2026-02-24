import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:merova/src/core/helper/token_storage.dart';

class CustomInterceptor extends Interceptor {
  final Dio dio;
  final TokenStorage storage;
  final Locale? locale;

  bool _isRefreshing = false;

  CustomInterceptor({required this.dio, required this.storage, this.locale});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 1. Handle Language Header
    if (locale != null) {
      options.headers['Accept-Language'] = locale!.languageCode;
    }
    final requiresAuth = options.extra['requiresAuth'] ?? true;

    if (requiresAuth) {
      final publicRoutes = [
        '/auth/login',
        '/auth/signup',
        '/auth/verify-otp',
        '/auth/forgot-password',
      ];

      // Only add token if it's not a public route
      if (!publicRoutes.contains(options.path)) {
        final token =
            await TokenStorage.getAccessToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (_isRefreshing) return;

      _isRefreshing = true;

      try {
        await _refreshToken();
        _isRefreshing = false;

        final response = await dio.fetch(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        _isRefreshing = false;
        await TokenStorage.clearTokens();
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  Future<void> _refreshToken() async {
    final refreshToken = await TokenStorage.getRefreshToken();

    if (refreshToken == null) throw Exception('No refresh token available');

    final response = await dio.post(
      '/auth/refresh',
      data: {'refresh_token': refreshToken},
    );

    await TokenStorage.saveTokens(
      accessToken: response.data['access_token'],
      refreshToken: response.data['refresh_token'] ?? refreshToken,
    );
  }
}
