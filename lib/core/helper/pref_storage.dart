import 'package:shared_preferences/shared_preferences.dart';

class PrefStorage {
  PrefStorage._();

  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  static void clearPreferencesData() async {
    sharedPreferences!.clear();
  }

  static Future<void> set(String key, dynamic value) async {
    await sharedPreferences!.setString(key, value);
  }

  static dynamic get(String key) {
    dynamic value = sharedPreferences!.getString(key);
    return value;
  }
}
