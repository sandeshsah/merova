import '../entity/payment_entity.dart';

abstract class PaymentRepository {
  Future<List<PaymentCategoryEntity>> getCategories();
  Future<List<PaymentServiceEntity>> getServices(String categoryId);
  Future<Map<String, dynamic>> processPayment(PaymentRequestEntity request);
}
