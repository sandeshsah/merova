class AuthRemoteDatasource {
  Future<Map<String, dynamic>> login(
    String UId,
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return {"UId": UId, "email": email, "password": password};
  }

  Future<Map<String, dynamic>> register(
    String UId,
    String email,
    String password,
  ) async {
    // Mock implementation - replace with actual API call
    await Future.delayed(const Duration(seconds: 1));
    return {"UId": UId, "email": email, "password": password};
  }
}
