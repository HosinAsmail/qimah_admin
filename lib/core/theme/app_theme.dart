import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/theme/widget_themes/appbar_theme.dart';
import 'package:qimah_admin/core/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:qimah_admin/core/theme/widget_themes/checkbox_theme.dart';
import 'package:qimah_admin/core/theme/widget_themes/chip_theme.dart';
import 'package:qimah_admin/core/theme/widget_themes/elevated_button_theme.dart';
import 'package:qimah_admin/core/theme/widget_themes/outlined_button_theme.dart';
import 'package:qimah_admin/core/theme/widget_themes/text_theme.dart';

import 'widget_themes/text_field_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // colorScheme: const ColorScheme.light(
    //   primary: Color(0X26431B36),
    //   primaryContainer: Color(0XFFB3806D),
    //   onPrimary: Color(0XFFD9D9D9),
    // ),
    fontFamily: 'Almarai',
    disabledColor: AppColor.grey,
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    textTheme: MyAppTextTheme.lightTextTheme,
    chipTheme: MyAppChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: MyAppAppBarTheme.lightAppBarTheme,
    checkboxTheme: MyAppCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: MyAppBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MyAppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyAppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MyAppTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Almarai',
    disabledColor: AppColor.grey,
    brightness: Brightness.dark,
    primaryColor: AppColor.primaryColor,
    textTheme: MyAppTextTheme.darkTextTheme,
    chipTheme: MyAppChipTheme.darkChipTheme,
    scaffoldBackgroundColor: AppColor.black,
    appBarTheme: MyAppAppBarTheme.darkAppBarTheme,
    checkboxTheme: MyAppCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: MyAppBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MyAppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MyAppOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MyAppTextFormFieldTheme.darkInputDecorationTheme,
  );
}
