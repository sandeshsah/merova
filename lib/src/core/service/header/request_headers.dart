class RequestHeaders {
  static Map<String, String> defaultHeaders({
    String? token,
    String? language = "en",
  }) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if(token != null) 'Authorization': 'Bearer $token',
      'Accept-Language': language ?? 'en',
    };
  }
}