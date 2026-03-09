import '../entity/payment_entity.dart';
import '../repository/payment_repository.dart';

class GetPaymentCategoriesUseCase {
  final PaymentRepository repository;

  GetPaymentCategoriesUseCase(this.repository);

  Future<List<PaymentCategoryEntity>> call() async {
    return await repository.getCategories();
  }
}
