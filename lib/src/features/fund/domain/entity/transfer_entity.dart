class TransferContactEntity {
  final String id;
  final String name;
  final String accountNumber;
  final String? bankName;
  final String? avatarUrl;

  TransferContactEntity({
    required this.id,
    required this.name,
    required this.accountNumber,
    this.bankName,
    this.avatarUrl,
  });
}

class TransferRequestEntity {
  final String recipientId;
  final String recipientName;
  final String recipientAccountNumber;
  final double amount;
  final String? remarks;
  final String? bankName;

  TransferRequestEntity({
    required this.recipientId,
    required this.recipientName,
    required this.recipientAccountNumber,
    required this.amount,
    this.remarks,
    this.bankName,
  });
}

class TransferResponseEntity {
  final String transactionId;
  final String status;
  final String message;
  final double amount;
  final DateTime timestamp;

  TransferResponseEntity({
    required this.transactionId,
    required this.status,
    required this.message,
    required this.amount,
    required this.timestamp,
  });
}
