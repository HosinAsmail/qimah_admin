import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

/* -- Light & Dark Elevated Button Themes -- */
class MyAppElevatedButtonTheme {
  MyAppElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.light,
      backgroundColor: AppColor.primaryColor,
      disabledForegroundColor: AppColor.darkGrey,
      disabledBackgroundColor: AppColor.buttonDisabled,
      side: const BorderSide(color: AppColor.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColor.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.light,
      backgroundColor: AppColor.primaryColor,
      disabledForegroundColor: AppColor.darkGrey,
      disabledBackgroundColor: AppColor.darkerGrey,
      side: const BorderSide(color: AppColor.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColor.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
  );
}
