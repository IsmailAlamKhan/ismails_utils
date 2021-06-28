import 'package:encrypt/encrypt.dart';
import '../../ismails_utils.dart';

class EncryptService with IsmailLoggerMixin {
  @override
  String name = 'EncryptService';
  factory EncryptService() {
    _instance.encrypter = Encrypter(AES(_instance.key));

    // ignore: no_runtimetype_tostring
    _instance.logInfo('${_instance.runtimeType} Started');
    return _instance;
  }
  EncryptService._();
  static final EncryptService _instance = EncryptService._();
  final key = Key.fromUtf8('EOPn6SSTvGcapjHA4dXA9xHZw2LjwWG=');
  final iv = IV.fromLength(16);
  late final Encrypter encrypter;
  Encrypted encrypt(String input) => encrypter.encrypt(input, iv: iv);
  String decrypt(String input) => encrypter.decrypt64(input, iv: iv);
}
