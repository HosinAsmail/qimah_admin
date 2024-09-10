import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class TopBar extends StatelessWidget {
  final String? text;
  final TextStyle? titleTextStyle;
  final Widget? leftIcon;
  final Widget? rightIcon;

  const TopBar(
      {super.key,
      this.text,
      this.titleTextStyle,
      this.leftIcon,
      this.rightIcon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0, top: 20),
              child: rightIcon,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                text ?? "",
                style: titleTextStyle ??
                    const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 20),
              child: leftIcon,
            ),
          ],
        ),
      ),
    );
  }
}
