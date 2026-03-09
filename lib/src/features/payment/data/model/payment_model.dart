import '../../domain/entity/payment_entity.dart';

class PaymentCategoryModel extends PaymentCategoryEntity {
  PaymentCategoryModel({
    required super.id,
    required super.name,
    required super.icon,
  });

  factory PaymentCategoryModel.fromJson(Map<String, dynamic> json) {
    return PaymentCategoryModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'icon': icon};
  }
}

class PaymentServiceModel extends PaymentServiceEntity {
  PaymentServiceModel({
    required super.id,
    required super.categoryId,
    required super.name,
    required super.icon,
    required super.description,
  });

  factory PaymentServiceModel.fromJson(Map<String, dynamic> json) {
    return PaymentServiceModel(
      id: json['id']?.toString() ?? '',
      categoryId:
          json['categoryId']?.toString() ??
          json['category_id']?.toString() ??
          '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'icon': icon,
      'description': description,
    };
  }
}

class PaymentRequestModel {
  final String serviceId;
  final double amount;
  final String accountIdentifier;
  final Map<String, dynamic>? extraData;

  PaymentRequestModel({
    required this.serviceId,
    required this.amount,
    required this.accountIdentifier,
    this.extraData,
  });

  Map<String, dynamic> toJson() {
    return {
      'service_id': serviceId,
      'amount': amount,
      'account_identifier': accountIdentifier,
      if (extraData != null) ...extraData!,
    };
  }
}
