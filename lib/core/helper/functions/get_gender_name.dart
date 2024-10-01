import 'package:qimah_admin/core/constant/app_enums.dart';

String toGenderName(int gender) {
  if (gender == 0) {
    return "ذكور";
  } else {
    return "إناث";
  }
}

GenderType toGenderType(int gender) {
  if (gender == 0) {
    return GenderType.male;
  } else {
    return GenderType.female;
  }
}

int toGenderNumber(String gender) {
  if (gender == "ذكور") {
    return 0;
  } else {
    return 1;
  }
}
