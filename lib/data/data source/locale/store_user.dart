import 'package:qimah_admin/core/helper/pref_storage.dart';
import 'package:qimah_admin/data/model/user_model.dart';

class StoreUser {
  StoreUser._();
  static Future<void> setUser(UserModel user) async {
    await PrefStorage.set("userModel", user);
  }

  static UserModel? getUser() {
    UserModel? user = PrefStorage.get('userModel');
    return user;
  }
}
