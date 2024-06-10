import 'package:qimah_admin/core/helper/functions/init_get_it.dart';
import 'package:qimah_admin/core/helper/pref_storage.dart';
import 'package:qimah_admin/data/data%20source/locale/store_step.dart';
import 'package:qimah_admin/data/data%20source/locale/store_token.dart';
import 'package:qimah_admin/data/model/user_model.dart';

abstract class InitServices {
  static Future<void> init() async {
    initGetIt();
    await PrefStorage.init();
    // PrefStorage.clearPreferencesData();
    UserModel.init();
    await testing();

    if (StoreStep.getStep() == "2") {
      // after login in
      await StoreToken.initTokenVariable();
      // getSth();
    }
  }



  static Future<void> testing() async {
    //$ testing:
    // StoreStep.setStep('1');
    // await StoreToken.storeToken(TokenModel(
    //   refreshToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ5b3VyX2RvbWFpbi5jb20iLCJhdWQiOiJtb2JpbGUgYXBwbGljYXRpb24iLCJpYXQiOjE3MTc0MTk3NzMsIm5iZiI6MTcxNzQxOTc3MywiZGF0YSI6eyJ1c2Vyc19pZCI6MSwidXNlcnNfY3JlYXRlZEF0IjoiMjAyMy0xMS0xMSAyMjo1MTo0OSIsInVzZXJzX25hbWUiOiJsZWVuIiwidXNlcnNfcGhvbmUiOiI1NDU0NTQ1NDUiLCJidXNpbmVzc19pZCI6MSwiYnVzaW5lc3NfbmFtZSI6Ilx1MDYyN1x1MDY0NFx1MDYyZVx1MDYzN1x1MDYyN1x1MDYyOCIsImJ1c2luZXNzX2FkZHJlc3MiOiJcdTA2MzFcdTA2NDNcdTA2NDYgXHUwNjI3XHUwNjQ0XHUwNjJmXHUwNjRhXHUwNjQ2IiwiYnVzaW5lc3NfaW1hZ2UiOiJcdTA2NGFcdTA2MjdcdTA2MjhcdTA2NGFcdTA2MjdcdTA2MzMiLCJidXNpbmVzc19hcHByb3ZlIjoxLCJyZWZyZXNoX3Rva2VuX2lkIjo3OTc2MTkwN319.lqk16-I9exLQcM8G5uwazz7JFBdvdQtcSsWKNDcVXBg",
    //     accessToken:
    //         "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ5b3VyX2RvbWFpbi5jb20iLCJhdWQiOiJtb2JpbGUgYXBwbGljYXRpb24iLCJpYXQiOjE3MTc0MDY1OTksIm5iZiI6MTcxNzQwNjU5OSwiZXhwIjoxNzE3NDEwMTk5LCJkYXRhIjp7InVzZXJzX2lkIjoxLCJ1c2Vyc19jcmVhdGVkQXQiOiIyMDIzLTExLTExIDIyOjUxOjQ5IiwidXNlcnNfbmFtZSI6ImxlZW4iLCJ1c2Vyc19waG9uZSI6IjU0NTQ1NDU0NSIsImJ1c2luZXNzX2lkIjoxLCJidXNpbmVzc19uYW1lIjoiXHUwNjI3XHUwNjQ0XHUwNjJlXHUwNjM3XHUwNjI3XHUwNjI4IiwiYnVzaW5lc3NfYWRkcmVzcyI6Ilx1MDYzMVx1MDY0M1x1MDY0NiBcdTA2MjdcdTA2NDRcdTA2MmZcdTA2NGFcdTA2NDYiLCJidXNpbmVzc19pbWFnZSI6Ilx1MDY0YVx1MDYyN1x1MDYyOFx1MDY0YVx1MDYyN1x1MDYzMyIsImJ1c2luZXNzX2FwcHJvdmUiOjF9fQ.nmh7J2-QiKU8wYBHYY6fzp_dzcIeTYraLCUYtDOuL9o"));
  }
}
