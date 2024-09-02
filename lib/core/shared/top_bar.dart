import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, this.text, this.TitleTextStyle});
  final String? text;

  final TextStyle? TitleTextStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
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
                  "assets/images/cog--work-loading-cog-gear-settings-machine.png",
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            Text(
              text ?? "",
              style: TitleTextStyle ??
                  TextStyle(
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
                  "assets/images/Vector (1).png",
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
