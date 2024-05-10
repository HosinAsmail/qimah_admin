import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class MyAppTextFormFieldTheme {
  MyAppTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColor.darkGrey,
    suffixIconColor: AppColor.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle:
        const TextStyle().copyWith(fontSize: 16.0, color: AppColor.black),
    hintStyle:
        const TextStyle().copyWith(fontSize: 14.0, color: AppColor.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: AppColor.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 1, color: AppColor.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 1, color: AppColor.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 1, color: AppColor.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 1, color: AppColor.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 2, color: AppColor.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColor.darkGrey,
    suffixIconColor: AppColor.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle:
        const TextStyle().copyWith(fontSize: 16.0, color: AppColor.white),
    hintStyle:
        const TextStyle().copyWith(fontSize: 14.0, color: AppColor.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: AppColor.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 1, color: AppColor.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 1, color: AppColor.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 1, color: AppColor.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 1, color: AppColor.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 2, color: AppColor.warning),
    ),
  );
}
