import 'package:dio/dio.dart';
import '../model/home_model.dart';
import 'home_datasource.dart';

class HomeRemoteDataSource implements HomeDataSource {
  final Dio _dio;

  HomeRemoteDataSource(this._dio);

  @override
  Future<HomeModel> getHomeData() async {
    try {
      final response = await _dio.get('/home'); // Placeholder endpoint
      if (response.statusCode == 200) {
        return HomeModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load home data');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load home data: ${e.message}');
    }
  }

  @override
  Future<List<TransactionModel>> getRecentTransactions() async {
    try {
      final response = await _dio.get(
        '/home/transactions',
      ); // Placeholder endpoint
      if (response.statusCode == 200) {
        final List data = response.data['transactions'];
        return data.map((e) => TransactionModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load transactions');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load transactions: ${e.message}');
    }
  }
}
