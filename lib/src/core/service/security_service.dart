import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:merova/src/core/constants/storage_keys.dart';

class SecurityService {
  final LocalAuthentication _auth = LocalAuthentication();
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  SecurityService(this._prefs);

  // --- Biometric Hardware Check ---
  Future<bool> canCheckBiometrics() async {
    final bool canCheck = await _auth.canCheckBiometrics;
    final bool isDeviceSupported = await _auth.isDeviceSupported();
    return canCheck || isDeviceSupported;
  }

  // --- Authentication Core ---
  Future<bool> authenticateBiometric({required String reason}) async {
    try {
      return await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
    } catch (e) {
      return false;
    }
  }

  // --- Login Security ---
  bool isBiometricLoginEnabled() {
    return _prefs.getBool(StorageKeys.isBiometricLoginEnabled) ?? false;
  }

  Future<void> enableBiometricLogin(bool enable) async {
    await _prefs.setBool(StorageKeys.isBiometricLoginEnabled, enable);
  }

  // --- Transaction Security ---
  bool isBiometricTransactionEnabled() {
    return _prefs.getBool(StorageKeys.isBiometricTransactionEnabled) ?? false;
  }

  Future<void> enableBiometricTransaction(bool enable) async {
    await _prefs.setBool(StorageKeys.isBiometricTransactionEnabled, enable);
  }

  // --- PIN Management ---
  bool isTransactionPinEnabled() {
    return _prefs.getBool(StorageKeys.isTransactionPinEnabled) ?? false;
  }

  Future<void> enableTransactionPin(bool enable) async {
    await _prefs.setBool(StorageKeys.isTransactionPinEnabled, enable);
  }

  Future<void> saveTransactionPin(String pin) async {
    await _secureStorage.write(key: StorageKeys.transactionPin, value: pin);
    await enableTransactionPin(true);
  }

  Future<bool> verifyTransactionPin(String inputPin) async {
    final storedPin = await _secureStorage.read(
      key: StorageKeys.transactionPin,
    );
    return storedPin == inputPin;
  }

  Future<bool> hasTransactionPin() async {
    final pin = await _secureStorage.read(key: StorageKeys.transactionPin);
    return pin != null && pin.isNotEmpty;
  }

  // --- Credential Management for Biometrics ---
  Future<void> saveCredentials(String identifier, String password) async {
    await _secureStorage.write(key: 'biometric_identifier', value: identifier);
    await _secureStorage.write(key: 'biometric_password', value: password);
  }

  Future<Map<String, String?>> getCredentials() async {
    final identifier = await _secureStorage.read(key: 'biometric_identifier');
    final password = await _secureStorage.read(key: 'biometric_password');
    return {'identifier': identifier, 'password': password};
  }

  Future<void> clearCredentials() async {
    await _secureStorage.delete(key: 'biometric_identifier');
    await _secureStorage.delete(key: 'biometric_password');
  }
}
