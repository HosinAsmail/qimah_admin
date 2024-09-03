import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 60,
            width: double.infinity,
            decoration: const BoxDecoration(
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
                    onTap: () {
                      DefaultTabController.of(context).animateTo(0);
                    },
                    child: Image.asset(
                      Assets.assetsImagesPerson2,
                      width: 23,
                      height: 23,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      DefaultTabController.of(context).animateTo(1);
                    },
                    child: Image.asset(
                      Assets.assetsImagesBell,
                      width: 23,
                      height: 23,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      DefaultTabController.of(context).animateTo(2);
                    },
                    child: Image.asset(
                      Assets.assetsImagesSearch,
                      width: 23,
                      height: 23,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      DefaultTabController.of(context).animateTo(3);
                    },
                    child: Image.asset(
                      Assets.assetsImagesHome,
                      width: 23,
                      height: 23,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
