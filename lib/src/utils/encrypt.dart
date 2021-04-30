import 'package:encrypt/encrypt.dart';
import 'package:ismails_utils/ismails_utils.dart';

class EncryptService {
  static late EncryptService instance;
  final key = Key.fromUtf8('EOPn6SSTvGcapjHA4dXA9xHZw2LjwWG=');
  final iv = IV.fromLength(16);
  late final Encrypter encrypter;
  Encrypted encrypt(String input) => encrypter.encrypt(input, iv: iv);
  String decrypt(String input) => encrypter.decrypt64(input, iv: iv);

  EncryptService.init() {
    encrypter = Encrypter(AES(key));
    instance = this;
    // ignore: no_runtimetype_tostring
    LoggerService.instance.logger.i('$runtimeType Started');
  }
}
