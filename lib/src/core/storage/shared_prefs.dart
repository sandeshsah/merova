// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPrefs {
//   static final SharedPrefs _instance = SharedPrefs._internal();
//   factory SharedPrefs() => _instance;
//   SharedPrefs._internal();
//
//   SharedPreferences? _prefs;
//
//   Future<void> init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }
//
//   Future<bool> setString(String key, String value) async {
//     return await _prefs!.setString(key, value);
//   }
//
//   String? getString(String key) {
//     return _prefs!.getString(key);
//   }
//
//   Future<bool> setBool(String key, bool value) async {
//     return await _prefs!.setBool(key, value);
//   }
//
//   bool? getBool(String key) {
//     return _prefs!.getBool(key);
//   }
//
//   Future<void> clear() async {
//     await _prefs!.clear();
//   }
// }
//
//
// //usage(init at app start)
// //await SharedPrefs().init();
// //await SharedPrefs().setBool('dark_mode', true);
