import '../model/transfer_model.dart';

abstract class FundTransferDataSource {
  Future<List<TransferContactModel>> getRecentContacts();
  Future<TransferResponseModel> performTransfer(TransferRequestModel request);
}
