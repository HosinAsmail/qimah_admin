import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool get isDark {
  return Get.theme.brightness == Brightness.dark;
}

class AppColor {
  // App theme colors
  static const Color primaryColor = Color(0xff431B36);
  static const Color primaryDarkModeColor = Color.fromARGB(255, 219, 122, 187);
  static const Color secondaryColor = Color(0XFFB3806D);
  static const Color thirdColor = Colors.amberAccent; // Text colors
  static const Color textPrimary = Color(0xFF333333);

  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Color.fromARGB(255, 101, 99, 99);
  // Background colors
  static const Color light = Color(0xFFF6F6F6);

  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);

  static Color darkContainer = AppColor.white.withOpacity(0.1);
  // Button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);

  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);
  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);

  static const Color borderSecondary = Color(0xFFE6E6E6);
  // Failure and validation colors

  static const Color warning = Color(0xFFF57C00);

  static const Color info = Color(0xFF1976D2);
  //colors
  static Color green = isDark
      ? const Color.fromARGB(255, 138, 234, 141)
      : const Color(0xFF388E3C);

  static Color red = isDark
      ? const Color.fromARGB(255, 255, 136, 128)
      : const Color(0xFFD32F2F);

  //black and white
  //white when dark mode and black when light mode
  static Color whiteBlackReverse = isDark ? Colors.white : Colors.black;

  //dark when dark mode and white when light mode
  static Color whiteBlackSame = isDark ? Colors.black : Colors.white;

  // Neutral Shades
  static const Color black = Color(0xFF232323);

  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
  static Color shadow =
      const Color.fromARGB(159, 199, 199, 199).withOpacity(0.3);

  AppColor._();
}
