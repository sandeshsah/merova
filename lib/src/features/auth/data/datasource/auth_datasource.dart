abstract class AuthDataSource {
  Future<Map<String, dynamic>> register(
    String full_name,
    String phone_number,
    String email,
    String password,
  );

  Future<Map<String, dynamic>> login(String identifier, String credential);

  Future<Map<String, dynamic>> verifyOtp(
    String identifier,
    String phone_number,
    String email,
    String phone_otp,
    String email_otp,
  );

  Future<Map<String, dynamic>> forgotPassword(String identifier);

  Future<Map<String, dynamic>> resetPassword(
    String identifier,
    String password,
  );
}
