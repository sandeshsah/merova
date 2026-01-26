import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<AuthEntity> call(String UId, String email, String password) {
    return repository.register(UId, email, password);
  }
}
