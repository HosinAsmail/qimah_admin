import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/constant/app_routes.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/widget/profile/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const TopBar(
              heightBar: 80,
              leftIcon: SizedBox(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.shadow,
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'الاسم الكريم',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 60),
                    ProfileItem(
                      title: 'الحساب الشخصي',
                      iconPath: Assets.assetsImagesPerson,
                      onTap: () {
                        Get.toNamed(AppRoute.personalScreen);
                      },
                    ),
                    const SizedBox(height: 15),
                    ProfileItem(
                      title: 'الطلاب',
                      iconPath: Assets.assetsImagesTowPeople,
                      onTap: () {
                        Get.toNamed(AppRoute.studentsScreen);
                      },
                    ),
                    const SizedBox(height: 15),
                    ProfileItem(
                      title: 'المشرفين',
                      iconPath: Assets.assetsImagesSupervisor,
                      onTap: () {
                        Get.toNamed(AppRoute.bossesScreen);
                      },
                    ),
                    const SizedBox(height: 15),
                    ProfileItem(
                      title: 'الحلقات',
                      iconPath: Assets.assetsImagesThreePeople,
                      onTap: () {
                        Get.toNamed(AppRoute.groupsScreen);
                      },
                    ),
                    const SizedBox(height: 15),
                    ProfileItem(
                      title: 'الدورات',
                      iconPath: Assets.assetsImagesPuzzle,
                      onTap: () {
                        Get.toNamed(AppRoute.coursesScreen);
                      },
                    ),
                    const SizedBox(height: 15),
                    ProfileItem(
                      title: 'المسابقات',
                      iconPath: Assets.assetsImagesStar,
                      onTap: () {},
                    ),
                    const SizedBox(height: 15),
                    ProfileItem(
                      title: 'تسجيل الخروج',
                      iconPath: Assets.assetsImagesLogout,
                      onTap: () {},
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
