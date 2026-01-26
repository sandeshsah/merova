import 'package:dio/dio.dart';

class RestClient {
  final Dio dio;
  
  RestClient(this.dio);

  Future<Response> get(
    String path,{
      Map<String, dynamic>? query,
      Options? options,
    }
  ){
    return dio.get(path, queryParameters: query, options: options);
  }

  Future<Response> post(
    String path,{
      dynamic data,
      Options? options,
    }
  ){
    return dio.post(path, data: data, options: options);
  }

  Future<Response> put(
    String path,{
      dynamic data,
      Options? options,
    }
  ){
    return dio.put(path, data: data, options: options);
  }

  Future<Response> delete(
    String path,{
      dynamic data,
      Options? options,
    }
  ){
    return dio.delete(path, data: data, options: options);
  }
}