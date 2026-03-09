import '../model/payment_model.dart';
import 'payment_datasource.dart';

class PaymentMockDataSource implements PaymentDataSource {
  @override
  Future<List<PaymentCategoryModel>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      PaymentCategoryModel(id: '1', name: 'Topup', icon: 'phone_android'),
      PaymentCategoryModel(id: '2', name: 'Electricity', icon: 'bolt'),
      PaymentCategoryModel(id: '3', name: 'Water', icon: 'water_drop'),
      PaymentCategoryModel(id: '4', name: 'Internet', icon: 'wifi'),
      PaymentCategoryModel(id: '5', name: 'TV', icon: 'tv'),
      PaymentCategoryModel(id: '6', name: 'Insurance', icon: 'security'),
    ];
  }

  @override
  Future<List<PaymentServiceModel>> getServices(String categoryId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (categoryId == '1') {
      return [
        PaymentServiceModel(
          id: 's1',
          categoryId: '1',
          name: 'NTC Topup',
          icon: 'phone',
          description: 'Nepal Telecom Topup',
        ),
        PaymentServiceModel(
          id: 's2',
          categoryId: '1',
          name: 'Ncell Topup',
          icon: 'phone',
          description: 'Ncell Axiata Topup',
        ),
        PaymentServiceModel(
          id: 's3',
          categoryId: '1',
          name: 'SmartCell',
          icon: 'phone',
          description: 'SmartCell Topup',
        ),
      ];
    }
    return [
      PaymentServiceModel(
        id: 's4',
        categoryId: categoryId,
        name: 'Generic Service 1',
        icon: 'payments',
        description: 'Description for service 1',
      ),
      PaymentServiceModel(
        id: 's5',
        categoryId: categoryId,
        name: 'Generic Service 2',
        icon: 'payments',
        description: 'Description for service 2',
      ),
    ];
  }

  @override
  Future<Map<String, dynamic>> processPayment(
    PaymentRequestModel request,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    return {
      'status': 'success',
      'transaction_id': 'TXN${DateTime.now().millisecondsSinceEpoch}',
      'amount': request.amount,
      'message':
          'Payment of NPR ${request.amount} to service ${request.serviceId} was successful.',
    };
  }
}
