import 'package:merova/src/features/auth/domain/entity/auth_entity.dart';
import 'package:merova/src/features/auth/domain/repository/auth_repository.dart';
import 'package:merova/src/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:merova/src/features/auth/data/model/Auth_model.dart';
import 'package:merova/src/core/helper/token_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<AuthEntity> Login(String identifier, String credential) async {
    final res = await datasource.login(identifier, credential);

    final accessToken = res['access_token'] ?? res['accessToken'];
    final refreshToken = res['refresh_token'] ?? res['refreshToken'];

    if (accessToken != null && refreshToken != null) {
      await TokenStorage.saveTokens(
        accessToken: accessToken.toString(),
        refreshToken: refreshToken.toString(),
      );
    }

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
  Future<Map<String, dynamic>> verifyOtp(
    String identifier,
    String phoneNumber,
    String email,
    String phone_otp,
    String email_otp,
  ) async {
    final res = await datasource.verifyOtp(
      identifier,
      phoneNumber,
      email,
      phone_otp,
      email_otp,
    );

    final accessToken = res['access_token'] ?? res['accessToken'];
    final refreshToken = res['refresh_token'] ?? res['refreshToken'];

    if (accessToken != null && refreshToken != null) {
      await TokenStorage.saveTokens(
        accessToken: accessToken.toString(),
        refreshToken: refreshToken.toString(),
      );
    }

    return res;
  }

  @override
  Future<Map<String, dynamic>> forgotPassword(String identifier) async {
    return await datasource.forgotPassword(identifier);
  }

  @override
  Future<Map<String, dynamic>> resetPassword(
    String identifier,
    String new_password,
  ) async {
    return await datasource.resetPassword(identifier, new_password);
  }
}
