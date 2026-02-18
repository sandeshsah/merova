import '../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Map<String, dynamic>> call(String fullName, String phoneNumber, String email, String password) {
    return repository.register(fullName, phoneNumber, email, password);
  }
}
