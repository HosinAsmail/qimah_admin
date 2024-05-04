import 'package:qimah_admin/core/functions/init_get_it.dart';
import 'package:qimah_admin/data/data%20source/locale/store_step_service.dart';

abstract class InitServices {
  static Future<void> init() async {
    initGetIt();
    await getIt.get<StoreStepService>().initSharedPreference();
    // StoreStepService().setStep('1');
  }
}
