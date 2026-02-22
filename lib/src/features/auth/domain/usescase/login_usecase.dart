import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<AuthEntity> call(String identifier, String credential) {
    return repository.Login(identifier, credential);
  }
}
