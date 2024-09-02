import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class TopBar extends StatelessWidget {
  final String? text;
  final TextStyle? titleTextStyle;

  const TopBar({super.key, this.text, this.titleTextStyle});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  Assets.assetsImagesSettings,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            Text(
              text ?? "",
              style: titleTextStyle ??
                  const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  Assets.assetsImagesVectorNoBackground,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
