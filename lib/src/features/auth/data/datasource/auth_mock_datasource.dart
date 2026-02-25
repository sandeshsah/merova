import 'auth_datasource.dart';

class AuthMockDataSource implements AuthDataSource {
  @override
  Future<Map<String, dynamic>> register(
    String full_name,
    String phone_number,
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      "status": "success",
      "message": "User registered successfully",
      "data": {
        "user": {
          "full_name": full_name,
          "email": email,
          "phone_number": phone_number,
        },
      },
    };
  }

  @override
  Future<Map<String, dynamic>> login(
    String identifier,
    String credential,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      "status": "success",
      "message": "Login successful",
      "data": {
        "user": {
          "full_name": "Mock User",
          "email": "mock@example.com",
          "phone_number": "+9779800000000",
        },
        "token": {
          "access_token": "mock_access_token",
          "refresh_token": "mock_refresh_token",
        },
      },
    };
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(
    String identifier,
    String phone_number,
    String email,
    String phone_otp,
    String email_otp,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      "status": "success",
      "message": "OTP verified successfully",
      "data": {
        "user": {
          "full_name": "Mock User",
          "email": "mock@example.com",
          "phone_number": "+9779800000000",
        },
      },
    };
  }

  @override
  Future<Map<String, dynamic>> forgotPassword(String identifier) async {
    await Future.delayed(const Duration(seconds: 1));
    return {"status": "success", "message": "Password reset OTP sent"};
  }

  @override
  Future<Map<String, dynamic>> resetPassword(
    String identifier,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return {"status": "success", "message": "Password reset successfully"};
  }
}
