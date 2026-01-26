/// Base class for all Failures
abstract class Failure {
  final String message;
  final int? code;

  Failure({required this.message, this.code});
}

/// Network failure (no internet, timeout)
class NetworkFailure extends Failure {
  NetworkFailure({super.message = 'No internet connection', super.code});
}

/// API failure (invalid response, server error)
class ApiFailure extends Failure {
  ApiFailure({required super.message, super.code});
}

/// Database/local storage failure
class LocalStorageFailure extends Failure {
  LocalStorageFailure({required super.message, super.code});
}

/// Validation failure (user input invalid)
class ValidationFailure extends Failure {
  ValidationFailure({required super.message});
}
