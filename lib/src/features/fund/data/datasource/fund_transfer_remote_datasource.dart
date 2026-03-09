import 'package:dio/dio.dart';
import '../model/transfer_model.dart';
import 'fund_transfer_datasource.dart';

class FundTransferRemoteDataSource implements FundTransferDataSource {
  final Dio _dio;

  FundTransferRemoteDataSource(this._dio);

  @override
  Future<List<TransferContactModel>> getRecentContacts() async {
    try {
      final response = await _dio.get('/fund/contacts/recent');
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => TransferContactModel.fromJson(json)).toList();
      }
      throw Exception('Failed to load recent contacts');
    } catch (e) {
      throw Exception('Load contacts error: $e');
    }
  }

  @override
  Future<TransferResponseModel> performTransfer(
    TransferRequestModel request,
  ) async {
    try {
      final response = await _dio.post(
        '/fund/transfer',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return TransferResponseModel.fromJson(response.data);
      }
      throw Exception('Fund transfer failed');
    } catch (e) {
      throw Exception('Perform transfer error: $e');
    }
  }
}
