import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // زيادة الارتفاع لمراعاة المساحة الإضافية في الأسفل
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIcon(context, Assets.assetsImagesPerson2, 0),
              _buildIcon(context, Assets.assetsImagesBell, 1),
              _buildIcon(context, Assets.assetsImagesSearch, 2),
              _buildIcon(context, Assets.assetsImagesHome, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context, String asset, int index) {
    return InkWell(
      onTap: () => DefaultTabController.of(context).animateTo(index),
      child: Image.asset(asset, width: 23, height: 23),
    );
  }
}
