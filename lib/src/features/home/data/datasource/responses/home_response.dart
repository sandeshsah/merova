import 'package:dio/dio.dart';
import 'package:merova/src/features/home/data/datasource/request/home_request.dart';
import 'package:merova/src/features/home/data/model/home_model.dart';


class HomeApiService {
  final Dio dio;

  HomeApiService(this.dio);

  Future<List<HomeModel>> fetchTransactions(HomeRequest request) async {
    final response = await dio.post(
      '/home/Dashboard',
      data: request.toJson(),
    );

    final List data = response.data['transactions'];
    return data.map((e) => HomeModel.fromJson(e)).toList();
  }
}
