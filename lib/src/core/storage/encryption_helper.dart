import 'package:encrypt/encrypt.dart';

class EncryptionHelper {
  static final key = Key.fromUtf8('16charssecretkey'); // must be 16/24/32 chars
  static final iv = IV.fromLength(16);

  static String encryptText(String text) {
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  static String decryptText(String encryptedText) {
    final encrypter = Encrypter(AES(key));
    final decrypted =
        encrypter.decrypt(Encrypted.fromBase64(encryptedText), iv: iv);
    return decrypted;
  }
}
