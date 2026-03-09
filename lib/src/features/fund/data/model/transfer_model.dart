import '../../domain/entity/transfer_entity.dart';

class TransferContactModel extends TransferContactEntity {
  TransferContactModel({
    required super.id,
    required super.name,
    required super.accountNumber,
    super.bankName,
    super.avatarUrl,
  });

  factory TransferContactModel.fromJson(Map<String, dynamic> json) {
    return TransferContactModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      accountNumber: json['account_number'] ?? json['accountNumber'] ?? '',
      bankName: json['bank_name'] ?? json['bankName'],
      avatarUrl: json['avatar_url'] ?? json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'account_number': accountNumber,
      'bank_name': bankName,
      'avatar_url': avatarUrl,
    };
  }
}

class TransferRequestModel {
  final String recipientId;
  final String recipientName;
  final String recipientAccountNumber;
  final double amount;
  final String? remarks;
  final String? bankName;

  TransferRequestModel({
    required this.recipientId,
    required this.recipientName,
    required this.recipientAccountNumber,
    required this.amount,
    this.remarks,
    this.bankName,
  });

  Map<String, dynamic> toJson() {
    return {
      'recipient_id': recipientId,
      'recipient_name': recipientName,
      'recipient_account_number': recipientAccountNumber,
      'amount': amount,
      'remarks': remarks,
      'bank_name': bankName,
    };
  }
}

class TransferResponseModel extends TransferResponseEntity {
  TransferResponseModel({
    required super.transactionId,
    required super.status,
    required super.message,
    required super.amount,
    required super.timestamp,
  });

  factory TransferResponseModel.fromJson(Map<String, dynamic> json) {
    return TransferResponseModel(
      transactionId:
          json['transaction_id']?.toString() ?? json['id']?.toString() ?? '',
      status: json['status'] ?? 'failed',
      message: json['message'] ?? '',
      amount: (json['amount'] is num)
          ? (json['amount'] as num).toDouble()
          : 0.0,
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
    );
  }
}
