import '../repository/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  Future<Map<String, dynamic>> call(String identifier) async {
    return await repository.forgotPassword(identifier);
  }
}
