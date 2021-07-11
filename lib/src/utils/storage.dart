import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  factory StorageService() => _instance;
  StorageService._();
  static final _instance = StorageService._();
  late final SharedPreferences pref;
  static Future<void> init() async {
    _instance.pref = await SharedPreferences.getInstance();
  }

  String? getNullableString(String key) => pref.getString(key);
  String getString(String key, {String fallback = ''}) =>
      pref.getString(key) ?? fallback;

  int? getNullableInt(String key) => pref.getInt(key);
  int getInt(String key, {int fallback = 0}) => pref.getInt(key) ?? fallback;
  bool? getNullableBool(String key) => pref.getBool(key);
  bool getBool(String key, {bool fallback = false}) =>
      pref.getBool(key) ?? fallback;
}
