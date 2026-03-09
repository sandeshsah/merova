import '../entity/transfer_entity.dart';
import '../repository/fund_transfer_repository.dart';

class GetRecentContactsUseCase {
  final FundTransferRepository repository;

  GetRecentContactsUseCase(this.repository);

  Future<List<TransferContactEntity>> call() async {
    return await repository.getRecentContacts();
  }
}
