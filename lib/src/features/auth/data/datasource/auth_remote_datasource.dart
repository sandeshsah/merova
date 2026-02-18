import 'package:dio/dio.dart';

class AuthRemoteDatasource {
  final Dio _dio;

  AuthRemoteDatasource(this._dio);

  Future<Map<String, dynamic>> register(
    String full_name,
    String phone_number,
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        '/auth/signup',
        data: {
          "full_name": full_name,
          "phone_number": phone_number,
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception(
          'Registration failed: ${response.statusCode} ${response.data}',
        );
      }
    } on DioException catch (e) {
      throw Exception(
        'Registration failed: ${e.response?.statusCode ?? 'Network Error'} ${e.response?.data ?? e.message}',
      );
    }
  }

  Future<Map<String, dynamic>> login(
    String identifier,
    String credential,
  ) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          "identifier": identifier,
          "credential": credential
        },
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception(
          'Login failed: ${response.statusCode} ${response.data}',
        );
      }
    } on DioException catch (e) {
      throw Exception(
        'Login failed: ${e.response?.statusCode ?? 'Network Error'} ${e.response?.data ?? e.message}',
      );
    }
  }

  Future<Map<String, dynamic>> verifyOtp(
    String phone_number,
    String otp,
  ) async {
    try {
      final response = await _dio.post(
        '/auth/verify-otp',
        data: {"phone_number": phone_number, "otp": otp},
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception(
          'OTP Verification failed: ${response.statusCode} ${response.data}',
        );
      }
    } on DioException catch (e) {
      throw Exception(
        'OTP Verification failed: ${e.response?.statusCode ?? 'Network Error'} ${e.response?.data ?? e.message}',
      );
    }
  }
}
