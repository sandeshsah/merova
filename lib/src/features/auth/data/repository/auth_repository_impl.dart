import 'package:merova/src/features/auth/domain/entity/auth_entity.dart';
import 'package:merova/src/features/auth/domain/repository/auth_repository.dart';
import 'package:merova/src/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:merova/src/features/auth/data/model/Auth_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<AuthEntity> Login(String identifier, String credential) async {
    final res = await datasource.login(identifier, credential);
    return AuthModel.fromJson(res);
  }

  @override
  Future<Map<String, dynamic>> register(
    String fullName,
    String phoneNumber,
    String email,
    String password,
  ) async {
    final res = await datasource.register(
      fullName,
      phoneNumber,
      email,
      password,
    );
    return res;
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(String phoneNumber, String otp) async {
    final res = await datasource.verifyOtp(phoneNumber, otp);
    return res;
  }
}
