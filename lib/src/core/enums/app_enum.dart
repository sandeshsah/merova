
enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  otpSent,
  error;

  bool get isLoading => this == AuthStatus.loading;
  bool get isAuthenticated => this == AuthStatus.authenticated;
  bool get isLoggedIn => this == AuthStatus.authenticated;
  bool get isError => this == AuthStatus.error;
  bool get isUnauthenticated => this == AuthStatus.unauthenticated;

  String get displayLabel {
    switch (this) {
      case AuthStatus.initial:
        return 'Initial';
      case AuthStatus.loading:
        return 'Loading...';
      case AuthStatus.authenticated:
        return 'Authenticated';
      case AuthStatus.unauthenticated:
        return 'Login';
      case AuthStatus.otpSent:
        return 'OTP Sent';
      case AuthStatus.error:
        return 'Error';
    }
  }
}

enum AuthFlow { login, register, forgotPassword }

enum HeaderAlignment { center, start }
enum FundTransferStatus { initial, loading, loaded, success, error }

enum TransferStep {
  selectOption,
  enterDetails,
  overview,
  pinVerification,
  success,
}

enum TransferType { scb, otherBank, mobileBanking }

enum VerificationMethod { biometric, email, sms }

enum PaymentStep {
  selectCategory,
  selectService,
  enterDetails,
  overview,
  pinVerification,
  success,
}