import 'package:dio/dio.dart';
import '../model/payment_model.dart';
import 'payment_datasource.dart';

class PaymentRemoteDataSource implements PaymentDataSource {
  final Dio _dio;

  PaymentRemoteDataSource(this._dio);

  @override
  Future<List<PaymentCategoryModel>> getCategories() async {
    try {
      final response = await _dio.get('/payment/categories');
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => PaymentCategoryModel.fromJson(json)).toList();
      }
      throw Exception('Failed to load categories');
    } catch (e) {
      throw Exception('Payment categories error: $e');
    }
  }

  @override
  Future<List<PaymentServiceModel>> getServices(String categoryId) async {
    try {
      final response = await _dio.get(
        '/payment/services',
        queryParameters: {'category_id': categoryId},
      );
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => PaymentServiceModel.fromJson(json)).toList();
      }
      throw Exception('Failed to load services');
    } catch (e) {
      throw Exception('Payment services error: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> processPayment(
    PaymentRequestModel request,
  ) async {
    try {
      final response = await _dio.post(
        '/payment/process',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw Exception('Payment processing failed');
    } catch (e) {
      throw Exception('Process payment error: $e');
    }
  }
}
