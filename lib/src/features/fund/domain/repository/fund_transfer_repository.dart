import '../entity/transfer_entity.dart';

abstract class FundTransferRepository {
  Future<List<TransferContactEntity>> getRecentContacts();
  Future<TransferResponseEntity> performTransfer(TransferRequestEntity request);
}
