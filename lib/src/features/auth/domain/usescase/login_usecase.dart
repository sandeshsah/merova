import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;


  LoginUseCase(this.repository);

  Future<AuthEntity> call(String UId, String email, String password) {
    return repository.Login(UId,email, password);
  }
}