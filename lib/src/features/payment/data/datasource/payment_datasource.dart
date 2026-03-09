import '../model/payment_model.dart';

abstract class PaymentDataSource {
  Future<List<PaymentCategoryModel>> getCategories();
  Future<List<PaymentServiceModel>> getServices(String categoryId);
  Future<Map<String, dynamic>> processPayment(PaymentRequestModel request);
}
