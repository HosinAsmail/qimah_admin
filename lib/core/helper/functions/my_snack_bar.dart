import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

void mySnackBar(ToastificationType action, String title, String message) {
  Toastification toastification = Toastification();

  IconData iconData() {
    if (action == ToastificationType.error) {
      return Icons.error_outline_outlined;
    } else if (action == ToastificationType.success) {
      return Icons.check_circle_outline_outlined;
    } else if (action == ToastificationType.info) {
      return Icons.info_outline;
    } else {
      return Icons.warning_outlined;
    }
  }

  toastification.show(
    type: action,
    icon: Icon(iconData()),
    style: ToastificationStyle.minimal,
    context: Get.context, // optional if you use ToastificationWrapper
    title: Text(title),
    description: Text(message),
    showProgressBar: false,
    autoCloseDuration: const Duration(seconds: 5),
  );
}
