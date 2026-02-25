import 'package:dio/dio.dart';
import 'auth_datasource.dart';

class AuthRemoteDatasource implements AuthDataSource {
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
        data: {"identifier": identifier, "credential": credential},
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
    String identifier,
    String phone_number,
    String email,
    String phone_otp,
    String email_otp,
  ) async {
    try {
      final response = await _dio.post(
        '/auth/verify-otp',
        data: {
          "identifier": identifier,
          if (phone_number.isNotEmpty) "phone_number": phone_number,
          if (email.isNotEmpty) "email": email,
          if (phone_otp.isNotEmpty) "phone_otp": phone_otp,
          if (email_otp.isNotEmpty) "email_otp": email_otp,
        },
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

  Future<Map<String, dynamic>> forgotPassword(String identifier) async {
    try {
      final response = await _dio.post(
        '/auth/forgot-password',
        data: {"identifier": identifier},
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception(
          'Forgot Password request failed: ${response.statusCode} ${response.data}',
        );
      }
    } on DioException catch (e) {
      throw Exception(
        'Forgot Password request failed: ${e.response?.statusCode ?? 'Network Error'} ${e.response?.data ?? e.message}',
      );
    }
  }

  Future<Map<String, dynamic>> resetPassword(
    String identifier,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        '/auth/reset-password',
        data: {"identifier": identifier, "password": password},
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception(
          'Password reset failed: ${response.statusCode} ${response.data}',
        );
      }
    } on DioException catch (e) {
      throw Exception(
        'Password reset failed: ${e.response?.statusCode ?? 'Network Error'} ${e.response?.data ?? e.message}',
      );
    }
  }
}
