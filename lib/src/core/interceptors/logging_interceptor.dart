import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        '\n'
        '╔════════════════════════════════════════════════════════════════\n'
        '║ 🚀 REQUEST\n'
        '╠════════════════════════════════════════════════════════════════\n'
        '║ Method: ${options.method}\n'
        '║ URL: ${options.uri}\n'
        '║ Headers:\n${_formatMap(options.headers)}'
        '${options.queryParameters.isNotEmpty ? '║ Query Parameters:\n${_formatMap(options.queryParameters)}' : ''}'
        '${options.data != null ? '║ Body: ${options.data}\n' : ''}'
        '╚════════════════════════════════════════════════════════════════\n',
      );
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        '\n'
        '╔════════════════════════════════════════════════════════════════\n'
        '║ ✅ RESPONSE\n'
        '╠════════════════════════════════════════════════════════════════\n'
        '║ Status Code: ${response.statusCode}\n'
        '║ URL: ${response.requestOptions.uri}\n'
        '║ Response Headers:\n${_formatMap(response.headers.map)}'
        '║ Response Data:\n'
        '║ ${_formatResponseData(response.data)}\n'
        '╚════════════════════════════════════════════════════════════════\n',
      );
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        '\n'
        '╔════════════════════════════════════════════════════════════════\n'
        '║ ❌ ERROR\n'
        '╠════════════════════════════════════════════════════════════════\n'
        '║ URL: ${err.requestOptions.uri}\n'
        '║ Status Code: ${err.response?.statusCode ?? 'N/A'}\n'
        '║ Error Type: ${err.type}\n'
        '║ Error Message: ${err.message}\n'
        '${err.response != null && err.response!.data != null ? '║ Error Response:\n║ ${_formatResponseData(err.response!.data)}\n' : ''}'
        '${err.stackTrace != null ? '║ Stack Trace:\n${_formatStackTrace(err.stackTrace!)}\n' : ''}'
        '╚════════════════════════════════════════════════════════════════\n',
      );
    }
    super.onError(err, handler);
  }

  /// Formats a map for pretty printing
  String _formatMap(Map<String, dynamic> map) {
    if (map.isEmpty) return '║   (empty)\n';
    return map.entries
            .map((entry) => '║   ${entry.key}: ${entry.value}')
            .join('\n') +
        '\n';
  }

  /// Formats response data for pretty printing
  String _formatResponseData(dynamic data) {
    if (data == null) return '(null)';
    final dataString = data.toString();
    if (dataString.length > 500) {
      return '${dataString.substring(0, 500)}... (truncated)';
    }
    return dataString;
  }

  /// Formats stack trace for better readability
  String _formatStackTrace(StackTrace stackTrace) {
    final lines = stackTrace.toString().split('\n');
    final limitedLines = lines.take(5).join('\n║   ');
    return '║   $limitedLines${lines.length > 5 ? '\n║   ... (${lines.length - 5} more lines)' : ''}';
  }
}
