import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/widget/profile/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const SizedBox(height: 70),
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
                    iconPath: Assets.assetsImagesPerson),
                const ProfileItem(
                  title: 'الطلاب',
                  iconPath: Assets.assetsImagesTowPeople,
                ),
                const ProfileItem(
                  title: 'الحلقات',
                  iconPath: Assets.assetsImagesThreePeople,
                ),
                const ProfileItem(
                  title: 'المشرفين',
                  iconPath: Assets.assetsImagesSupervisor,
                ),
                const ProfileItem(
                  title: 'المسابقات',
                  iconPath: Assets.assetsImagesStar,
                ),
                const ProfileItem(
                  title: 'الدورات',
                  iconPath: Assets.assetsImagesPuzzle,
                ),
                const ProfileItem(
                  title: 'تسجيل الخروج',
                  iconPath: Assets.assetsImagesLogout,
                ),
                // const SizedBox(height: 50),
              ],
            ),
          ),
        ),
        const TopBar(),
      ],
    );
  }
}
