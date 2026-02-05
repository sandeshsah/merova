import 'package:dio/dio.dart';
import '../storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage storage;

  AuthInterceptor(this.storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip adding token for public auth routes
    final publicRoutes = [
      '/auth/login',
      '/auth/signup',
      '/auth/verify-otp',
      '/auth/forgot-password',
    ];

    if (publicRoutes.contains(options.path)) {
      return super.onRequest(options, handler);
    }

    final token = await storage.readToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}
