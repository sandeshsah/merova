import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';
import '../model/Auth_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<AuthEntity> Login(String UId, String email, String password) async {
    final res = await datasource.login(UId, email, password);
    return AuthModel.fromJson(res);
  }

  @override
  Future<AuthEntity> register(String UId, String email, String password) async {
    final res = await datasource.register(UId, email, password);
    return AuthModel.fromJson(res);
  }
}
