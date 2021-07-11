import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences pref;
  Future<StorageService> init() async {
    pref = await SharedPreferences.getInstance();
    return this;
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
