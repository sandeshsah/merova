import '../entity/transfer_entity.dart';
import '../repository/fund_transfer_repository.dart';

class PerformTransferUseCase {
  final FundTransferRepository repository;

  PerformTransferUseCase(this.repository);

  Future<TransferResponseEntity> call(TransferRequestEntity request) async {
    return await repository.performTransfer(request);
  }
}
