// import 'package:hive_flutter/hive_flutter.dart';
// import 'encryption_helper.dart';
//
// class HiveStorage {
//   static Future<void> init() async {
//     await Hive.initFlutter();
//   }
//
//   static Future<Box> openBox(String name) async {
//     return await Hive.openBox(name);
//   }
//
//   // Save data (encrypt if string)
//   static Future<void> put(String boxName, String key, dynamic value,
//       {bool encrypt = false}) async {
//     final box = await openBox(boxName);
//     if (encrypt && value is String) {
//       final encrypted = EncryptionHelper.encryptText(value);
//       await box.put(key, encrypted);
//     } else {
//       await box.put(key, value);
//     }
//   }
//
//   // Get data (decrypt if encrypted)
//   static Future<dynamic> get(String boxName, String key,
//       {bool decrypt = false}) async {
//     final box = await openBox(boxName);
//     final value = box.get(key);
//     if (decrypt && value is String) {
//       return EncryptionHelper.decryptText(value);
//     }
//     return value;
//   }
//
//   static Future<void> delete(String boxName, String key) async {
//     final box = await openBox(boxName);
//     await box.delete(key);
//   }
//
//   static Future<void> clearBox(String boxName) async {
//     final box = await openBox(boxName);
//     await box.clear();
//   }
// }



//usage
//await HiveStorage.init();
//await HiveStorage.put('chat_box', 'msg_1', 'Hello World', encrypt: true);
//String? msg = await HiveStorage.get('chat_box', 'msg_1', decrypt: true);
