import 'dart:convert';
import 'package:qimah_admin/core/helper/pref_storage.dart';
import 'package:qimah_admin/data/model/user_model.dart';

class StoreUser {
  StoreUser._();
  static Future<void> setUser(UserModel user) async {
    await PrefStorage.set("userModel", jsonEncode(user.toJson()));
  }

  static UserModel? getUser() {
    String? jsonString = PrefStorage.get('userModel');
    if (jsonString != null) {
      UserModel? user = UserModel.fromJson(jsonDecode(jsonString));
      return user;
    }
    return null;
  }
}
