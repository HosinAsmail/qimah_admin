import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/magnifying-glass--glass-search-magnifying (2).png",
                    width: 23,
                    height: 23,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/Bell.png",
                    width: 23,
                    height: 23,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/magnifying-glass--glass-search-magnifying.png",
                    width: 23,
                    height: 23,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/home-3--home-house-roof-shelter.png",
                    width: 23,
                    height: 23,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
