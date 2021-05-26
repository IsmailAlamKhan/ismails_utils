import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  factory StorageService() => _instance;
  StorageService._();
  static final _instance = StorageService._();
  late final SharedPreferences pref;
  static Future<void> init() async {
    _instance.pref = await SharedPreferences.getInstance();
  }
}
