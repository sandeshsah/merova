import 'package:merova/src/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> Login(String identifier, String credential);
  Future<Map<String, dynamic>> register(
    String fullName,
    String phoneNumber,
    String email,
    String password,
  );
  Future<Map<String, dynamic>> verifyOtp(
    String identifier,
    String phoneNumber,
    String email,
    String phone_otp,
    String email_otp,
  );
  Future<Map<String, dynamic>> forgotPassword(String identifier);
  Future<Map<String, dynamic>> resetPassword(
    String identifier,
    String password,
  );
}
