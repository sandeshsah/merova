import '../entity/payment_entity.dart';
import '../repository/payment_repository.dart';

class ProcessPaymentUseCase {
  final PaymentRepository repository;

  ProcessPaymentUseCase(this.repository);

  Future<Map<String, dynamic>> call(PaymentRequestEntity request) async {
    return await repository.processPayment(request);
  }
}
