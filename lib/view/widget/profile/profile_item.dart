import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/constant/app_int.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppInt.horizontalPadding),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.whiteBlackSame,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadow,
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: AppColor.secondaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            onTap: onTap ?? () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image.asset(
                    iconPath,
                    width: 24,
                    height: 24,
                    color: AppColor.secondaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 10, 16),
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
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Image.asset(
                    Assets.assetsImagesVectorWhite,
                    width: 20,
                    height: 20,
                    color: AppColor.secondaryColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
