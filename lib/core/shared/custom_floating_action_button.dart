import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFloatingActionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ), // Teal color
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
