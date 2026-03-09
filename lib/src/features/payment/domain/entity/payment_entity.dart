class PaymentCategoryEntity {
  final String id;
  final String name;
  final String icon;

  PaymentCategoryEntity({
    required this.id,
    required this.name,
    required this.icon,
  });
}

class PaymentServiceEntity {
  final String id;
  final String categoryId;
  final String name;
  final String icon;
  final String description;

  PaymentServiceEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.icon,
    required this.description,
  });
}

class PaymentRequestEntity {
  final String serviceId;
  final double amount;
  final String accountIdentifier; // e.g., phone number or account number
  final Map<String, dynamic>? extraData;

  PaymentRequestEntity({
    required this.serviceId,
    required this.amount,
    required this.accountIdentifier,
    this.extraData,
  });
}
