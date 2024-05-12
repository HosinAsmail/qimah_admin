import 'package:qimah_admin/core/helper/functions/init_get_it.dart';
import 'package:qimah_admin/core/helper/pref_storage.dart';
import 'package:qimah_admin/data/data%20source/locale/store_step.dart';

abstract class InitServices {
  static Future<void> init() async {
    initGetIt();
    PrefStorage.init();
    // StoreStep.setStep('1');
  }
}
