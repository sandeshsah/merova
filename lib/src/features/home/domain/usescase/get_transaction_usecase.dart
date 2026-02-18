import 'package:merova/src/features/home/domain/entity/home_entity.dart';
import '../repository/home_repository.dart';

class GetTransactionUseCase {
  final HomeRepository repository;

  GetTransactionUseCase(this.repository);

  Future<List<TransactionEntity>> call() async {
    return await repository.getRecentTransactions();
  }
}
