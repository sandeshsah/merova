import '../model/home_model.dart';

abstract class HomeDataSource {
  Future<HomeModel> getHomeData();
  Future<List<TransactionModel>> getRecentTransactions();
}

// class HomeDataSource {
//   final Dio dio;
//
//   HomeDataSource(this.dio);
//
//   Future<List<TransactionModel>> fetchTransactions(HomeRequest request) async {
//     final response = await dio.post(
//       '/home/transactions',
//       data: request.toJson(),
//     );
//
//     final List data = response.data['transactions'];
//     return data.map((e) => TransactionModel.fromJson(e)).toList();
//   }
// }
