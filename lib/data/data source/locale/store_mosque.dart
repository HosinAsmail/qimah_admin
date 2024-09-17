import 'dart:convert';
import 'package:qimah_admin/core/helper/pref_storage.dart';

import 'package:qimah_admin/data/model/mosque models/mosque_model.dart';

class StoreMosque {
  StoreMosque._();
  static Future<void> setMosque(MosqueModel mosque) async {
    await PrefStorage.set("mosqueModel", jsonEncode(mosque.toJson()));
  }

  static MosqueModel? getMosque() {
    String? jsonString = PrefStorage.get('mosqueModel');
    if (jsonString != null) {
      MosqueModel? mosque = MosqueModel.fromJson(jsonDecode(jsonString));
      return mosque;
    }
    return null;
  }
}
