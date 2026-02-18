import 'package:merova/src/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> Login(String identifier, String credential);
  Future<Map<String, dynamic>> register(
    String fullName,
    String phoneNumber,
    String email,
    String password,
  );
  Future<Map<String, dynamic>> verifyOtp(String phoneNumber, String otp);
}
