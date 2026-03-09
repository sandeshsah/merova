import '../../domain/entity/payment_entity.dart';
import '../../domain/repository/payment_repository.dart';
import '../datasource/payment_datasource.dart';
import '../model/payment_model.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDataSource dataSource;

  PaymentRepositoryImpl(this.dataSource);

  @override
  Future<List<PaymentCategoryEntity>> getCategories() async {
    return await dataSource.getCategories();
  }

  @override
  Future<List<PaymentServiceEntity>> getServices(String categoryId) async {
    return await dataSource.getServices(categoryId);
  }

  @override
  Future<Map<String, dynamic>> processPayment(
    PaymentRequestEntity request,
  ) async {
    final model = PaymentRequestModel(
      serviceId: request.serviceId,
      amount: request.amount,
      accountIdentifier: request.accountIdentifier,
      extraData: request.extraData,
    );
    return await dataSource.processPayment(model);
  }
}
