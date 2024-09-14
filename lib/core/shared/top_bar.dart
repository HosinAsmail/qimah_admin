import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

import '../constant/app_assets.dart';

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
              child: rightIcon ??
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      Assets.assetsImagesSettings,
                      width: 30,
                      height: 30,
                    ),
                  ),
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
              child: Material(
                color: const Color.fromARGB(0, 121, 102, 102),
                child: leftIcon ??
                    InkWell(
                      // borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        Assets.assetsImagesVectorNoBackground,
                        width: 30,
                        height: 30,
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
