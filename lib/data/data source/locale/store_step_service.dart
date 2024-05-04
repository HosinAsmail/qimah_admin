import 'package:shared_preferences/shared_preferences.dart';

class StoreStepService {
  late SharedPreferences sharedPreferences;

  Future<void> initSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setStep(String step) async {
    await sharedPreferences.setString('step', step);
  }

  String? getStep() {
    String? step = sharedPreferences.getString('step');
    return step;
  }

  Future<void> clear() async {
    await sharedPreferences.clear();
  }
}
