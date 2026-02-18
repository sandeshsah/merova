// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class SecureStorage {
//   static final SecureStorage _instance = SecureStorage._internal();
//   factory SecureStorage() => _instance;
//   SecureStorage._internal();
//
//   final FlutterSecureStorage _storage = const FlutterSecureStorage();
//
//   Future<void> write(String key, String value) async {
//     await _storage.write(key: key, value: value);
//   }
//
//   Future<String?> read(String key) async {
//     return await _storage.read(key: key);
//   }
//
//   Future<void> writeToken(String token) async {
//     await write('access_token', token);
//   }
//
//   Future<String?> readToken() async {
//     return await read('access_token');
//   }
//
//   Future<void> deleteToken() async {
//     await delete('access_token');
//   }
//
//   Future<void> delete(String key) async {
//     await _storage.delete(key: key);
//   }
//
//   Future<void> deleteAll() async {
//     await _storage.deleteAll();
//   }
// }


//usage
//await SecureStorage().write('access_token', 'your_token_here');
//String? helper = await SecureStorage().read('access_token');
