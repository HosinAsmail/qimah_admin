import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/screens/base/inside_profile/bosses_screen.dart';
import 'package:qimah_admin/view/screens/base/inside_profile/personal_screen.dart';
import 'package:qimah_admin/view/screens/base/inside_profile/rings_screen.dart';
import 'package:qimah_admin/view/screens/base/inside_profile/students_screen.dart';
import 'package:qimah_admin/view/widget/profile/profile_item.dart';

void _navigateToBossesScreen() {
  Get.to(() =>  BossesScreen());
}

void _navigateToPersonalScreen() {
  Get.to(() => const PersonalScreen());
}

void _navigateToRingsScreen() {
  Get.to(() =>  RingsScreen());
}

void _navigateToStudentsScreen() {
  Get.to(() =>  StudentsScreen());
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(159, 158, 158, 158)
                              .withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundColor: Color.fromARGB(255, 225, 232, 235),
                      child: Icon(
                        Icons.person,
                        size: 50,
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
                  const SizedBox(height: 30),
                  const ProfileItem(
                    title: 'الحساب الشخصي',
                    iconPath: Assets.assetsImagesPerson,
                    ontap: _navigateToPersonalScreen,
                  ),
                  const ProfileItem(
                    title: 'الطلاب',
                    iconPath: Assets.assetsImagesTowPeople,
                    ontap: _navigateToStudentsScreen,
                  ),
                  const ProfileItem(
                    title: 'الحلقات',
                    iconPath: Assets.assetsImagesThreePeople,
                    ontap: _navigateToRingsScreen,
                  ),
                  const ProfileItem(
                    title: 'المشرفين',
                    iconPath: Assets.assetsImagesSupervisor,
                    ontap: _navigateToBossesScreen,
                  ),
                  const ProfileItem(
                    title: 'المسابقات',
                    iconPath: Assets.assetsImagesStar,
                    ontap: _navigateToPersonalScreen,
                  ),
                  const ProfileItem(
                    title: 'الدورات',
                    iconPath: Assets.assetsImagesPuzzle,
                    ontap: _navigateToPersonalScreen,
                  ),
                  const ProfileItem(
                    title: 'تسجيل الخروج',
                    iconPath: Assets.assetsImagesLogout,
                    ontap: _navigateToPersonalScreen,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          TopBar(
            leftIcon: InkWell(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                Assets.assetsImagesVectorNoBackground,
                width: 25,
                height: 25,
              ),
            ),
            rightIcon: InkWell(
              onTap: () {},
              child: Image.asset(
                Assets.assetsImagesSettings,
                width: 25,
                height: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
