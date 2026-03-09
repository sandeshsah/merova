import '../model/transfer_model.dart';
import 'fund_transfer_datasource.dart';

class FundTransferMockDataSource implements FundTransferDataSource {
  @override
  Future<List<TransferContactModel>> getRecentContacts() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      TransferContactModel(
        id: 'c1',
        name: 'John Doe',
        accountNumber: '9841234567',
        avatarUrl: null,
      ),
      TransferContactModel(
        id: 'c2',
        name: 'Jane Smith',
        accountNumber: '001122334455',
        bankName: 'Global IME Bank',
        avatarUrl: null,
      ),
      TransferContactModel(
        id: 'c3',
        name: 'Alice Cooper',
        accountNumber: '554433221100',
        bankName: 'Nabil Bank',
        avatarUrl: null,
      ),
    ];
  }

  @override
  Future<TransferResponseModel> performTransfer(
    TransferRequestModel request,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    return TransferResponseModel(
      transactionId: 'FTXN${DateTime.now().millisecondsSinceEpoch}',
      status: 'success',
      message:
          'Successfully transferred NPR ${request.amount} to ${request.recipientName}',
      amount: request.amount,
      timestamp: DateTime.now(),
    );
  }
}
