import 'package:merova/src/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> Login(String UId, String email, String password);
  Future<AuthEntity> register(String UId, String email, String password);
}
