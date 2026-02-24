import '../repository/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Map<String, dynamic>> call(
    String identifier,
    String phone_number,
    String email,
    String phone_otp,
    String email_otp,
  ) {
    return repository.verifyOtp(
      identifier,
      phone_number,
      email,
      phone_otp,
      email_otp,
    );
  }
}
