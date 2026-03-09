import '../entity/payment_entity.dart';
import '../repository/payment_repository.dart';

class GetPaymentServicesUseCase {
  final PaymentRepository repository;

  GetPaymentServicesUseCase(this.repository);

  Future<List<PaymentServiceEntity>> call(String categoryId) async {
    return await repository.getServices(categoryId);
  }
}
