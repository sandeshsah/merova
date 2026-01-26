/// Base class for all app-specific exceptions
class AppException implements Exception {
  final String message;
  final int? code;

  AppException({required this.message, this.code});

  @override
  String toString() => 'AppException(code: $code, message: $message)';
}

/// Network-related exception
class NetworkException extends AppException {
  NetworkException({String message = 'No internet connection', int? code})
      : super(message: message, code: code);
}

/// API-related exception
class ApiException extends AppException {
  ApiException({required String message, int? code}) : super(message: message, code: code);
}

/// Database/local storage exception
class LocalStorageException extends AppException {
  LocalStorageException({required String message, int? code}) : super(message: message, code: code);
}

/// Validation or input-related exception
class ValidationException extends AppException {
  ValidationException({required String message}) : super(message: message);
}


//usage 
//throw NetworkException();
//throw ApiException(message: 'Invalid API key', code: 401);
