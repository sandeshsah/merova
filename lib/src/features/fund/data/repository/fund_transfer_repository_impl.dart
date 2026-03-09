import '../../domain/entity/transfer_entity.dart';
import '../../domain/repository/fund_transfer_repository.dart';
import '../datasource/fund_transfer_datasource.dart';
import '../model/transfer_model.dart';

class FundTransferRepositoryImpl implements FundTransferRepository {
  final FundTransferDataSource dataSource;

  FundTransferRepositoryImpl(this.dataSource);

  @override
  Future<List<TransferContactEntity>> getRecentContacts() async {
    return await dataSource.getRecentContacts();
  }

  @override
  Future<TransferResponseEntity> performTransfer(
    TransferRequestEntity request,
  ) async {
    final model = TransferRequestModel(
      recipientId: request.recipientId,
      recipientName: request.recipientName,
      recipientAccountNumber: request.recipientAccountNumber,
      amount: request.amount,
      remarks: request.remarks,
      bankName: request.bankName,
    );
    return await dataSource.performTransfer(model);
  }
}
