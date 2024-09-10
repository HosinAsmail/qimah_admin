import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  const ProfileItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.whiteBlackSame,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(54, 158, 158, 158),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              Assets.assetsImagesVectorWhite,
              width: 18,
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
