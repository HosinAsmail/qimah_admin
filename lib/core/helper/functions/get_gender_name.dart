String toGenderName(int gender) {
  if (gender == 0) {
    return "ذكور";
  } else {
    return "إناث";
  }
}

int toGenderNumber(String gender) {
  if (gender == "ذكور") {
    return 0;
  } else {
    return 1;
  }
}
