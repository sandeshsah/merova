
enum AuthState{
  initial("LOGIN"),
  loading("LOGGING"),
  authenticated("SUCCESS"),
  unauthenticated("Error");

  final String value;
   const AuthState(this.value);


}


// 🔹 TRANSACTION RELATED ENUMS
enum TransactionStatus {
  pending("PENDING"),
  processing("PROCESSING"),
  success("SUCCESS"),
  failed("FAILED"),
  reversed("REVERSED"),
  cancelled("CANCELLED");

  final String apiValue;

  const TransactionStatus(this.apiValue);

  bool get isCompleted =>
      this == TransactionStatus.success ||
          this == TransactionStatus.failed ||
          this == TransactionStatus.cancelled ||
          this == TransactionStatus.reversed;

  static TransactionStatus fromApi(String value) {
    return TransactionStatus.values.firstWhere(
          (e) => e.apiValue == value.toUpperCase(),
      orElse: () => TransactionStatus.failed,
    );
  }
}

extension TransactionStatusExt on TransactionStatus {
  String get readable {
    switch (this) {
      case TransactionStatus.pending:
        return "Pending";
      case TransactionStatus.processing:
        return "Processing";
      case TransactionStatus.success:
        return "Successful";
      case TransactionStatus.failed:
        return "Failed";
      case TransactionStatus.reversed:
        return "Reversed";
      case TransactionStatus.cancelled:
        return "Cancelled";
    }
  }

  bool get showRetry =>
      this == TransactionStatus.failed || this == TransactionStatus.cancelled;
}


// 💳 CARD RELATED ENUMS


enum CardType {
  debit("DEBIT"),
  credit("CREDIT"),
  prepaid("PREPAID"),
  virtual("VIRTUAL");

  final String api;

  const CardType(this.api);

  bool get supportsATM => this == CardType.debit || this == CardType.credit;
}

extension CardTypeExt on CardType {
  String get label {
    switch (this) {
      case CardType.debit:
        return "Debit Card";
      case CardType.credit:
        return "Credit Card";
      case CardType.prepaid:
        return "Prepaid Card";
      case CardType.virtual:
        return "Virtual Card";
    }
  }
}


// 💰 CURRENCY ENUMS


enum Currency {
  npr("NPR", "रू"),
  usd("USD", "\$"),
  eur("EUR", "€"),
  inr("INR", "₹");

  final String code;
  final String symbol;

  const Currency(this.code, this.symbol);
}

extension CurrencyFormatExt on Currency {
  String format(num amount) => "$symbol$amount";
}


// 👤 USER / ACCOUNT ENUMS


enum UserTier {
  basic(1),
  silver(2),
  gold(3),
  platinum(4);

  final int level;

  const UserTier(this.level);

  bool get isKycCompleted => level >= 2;
}

enum AccountType {
  savings("SAVINGS"),
  current("CURRENT"),
  salary("SALARY"),
  fixedDeposit("FD"),
  recurringDeposit("RD");

  final String api;

  const AccountType(this.api);

  bool get supportsWithdrawal =>
      this == AccountType.savings || this == AccountType.current;
}


// 🌍 ENVIRONMENT ENUM


enum Environment {
  dev("https://dev.api.bank.com"),
  staging("https://staging.api.bank.com"),
  production("https://api.bank.com");

  final String baseUrl;

  const Environment(this.baseUrl);
}


// ⚠️ ERROR ENUMS


enum ErrorCode {
  invalidOtp("INVALID_OTP"),
  insufficientBalance("INSUFFICIENT_FUNDS"),
  cardBlocked("CARD_BLOCKED"),
  sessionExpired("SESSION_EXPIRED");

  final String api;

  const ErrorCode(this.api);
}

extension ErrorCodeMessage on ErrorCode {
  String get message {
    switch (this) {
      case ErrorCode.invalidOtp:
        return "The OTP entered is incorrect.";
      case ErrorCode.insufficientBalance:
        return "Not enough balance.";
      case ErrorCode.cardBlocked:
        return "Your card is blocked.";
      case ErrorCode.sessionExpired:
        return "Please log in again.";
    }
  }
}


// 🔐 AUTH / SESSION STATE ENUMS


// enum AuthState {
//   loggedOut,
//   loggingIn,
//   loggedIn,
//   sessionExpired,
//   blocked;
// }


