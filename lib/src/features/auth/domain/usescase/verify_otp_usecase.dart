import '../repository/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Map<String, dynamic>> call(String phone_number, String otp) {
    return repository.verifyOtp(phone_number, otp);
  }
}
