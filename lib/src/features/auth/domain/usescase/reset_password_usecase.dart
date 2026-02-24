import '../repository/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<Map<String, dynamic>> call(String identifier, String password) async {
    return await repository.resetPassword(identifier, password);
  }
}
