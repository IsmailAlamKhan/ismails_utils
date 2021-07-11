import 'package:encrypt/encrypt.dart';
import '../../ismails_utils.dart';

class EncryptService with IsmailLoggerMixin {
  @override
  String name = 'EncryptService';

  final key = Key.fromUtf8('EOPn6SSTvGcapjHA4dXA9xHZw2LjwWG=');
  final iv = IV.fromLength(16);
  late final Encrypter encrypter;
  Encrypted encrypt(String input) => encrypter.encrypt(input, iv: iv);
  String decrypt(String input) => encrypter.decrypt64(input, iv: iv);
}
