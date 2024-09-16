import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 13.0, top: 15),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: const Color.fromARGB(0, 215, 0, 0),
                  child: rightIcon ??
                      InkWell(
                        hoverColor: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: const Icon(
                          Icons.settings,
                          color: AppColor.primaryColor,
                          size: 30,
                        ),
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                text ?? "",
                style: titleTextStyle ??
                    const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0, top: 15),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: const Color.fromARGB(0, 215, 0, 0),
                  child: leftIcon ??
                      InkWell(
                        hoverColor: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Get.back();
                        },
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(3.1416),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColor.primaryColor,
                            size: 30,
                          ),
                        ),
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
