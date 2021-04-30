import 'package:encrypt/encrypt.dart';

class EncryptService {
  static late EncryptService instance;
  final key = Key.fromUtf8('EOPn6SSTvGcapjHA4dXA9xHZw2LjwWGFoWZMGLE59Ls=');
  final iv = IV.fromLength(16);
  late final Encrypter encrypter;
  Encrypted encrypt(String input) => encrypter.encrypt(input, iv: iv);
  void decrypt(Encrypted input) => encrypter.decrypt(input, iv: iv);

  EncryptService.init() {
    encrypter = Encrypter(AES(key));
    instance = this;
  }
}
