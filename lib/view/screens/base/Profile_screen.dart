import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: UserProfileScreen(),
//       ),
//     );
//   }
// }

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    SizedBox(height: 70),
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
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Color.fromARGB(255, 225, 232, 235),
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'الاسم الكريم',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    buildMenuItem(context, 'الحساب الشخصي',
                        'assets/images/magnifying-glass--glass-search-magnifying (5).png'),
                    buildMenuItem(context, 'الطلاب',
                        'assets/images/user-multiple-group--close-geometric-human-multiple-person-up-user.png'),
                    buildMenuItem(context, 'الحلقات',
                        'assets/images/group-meeting-call--group-meeting-call-work.png'),
                    buildMenuItem(context, 'المشرفين',
                        'assets/images/user-single-neutral-male--close-geometric-human-person-single-up-user-male.png'),
                    buildMenuItem(context, 'المسابقات',
                        'assets/images/star-1--reward-rating-rate-social-star-media-favorite-like-stars.png'),
                    buildMenuItem(context, 'الدورات',
                        'assets/images/module-puzzle-3--code-puzzle-module-programming-plugin-piece.png'),
                    buildMenuItem(context, 'تسجيل الخروج',
                        'assets/images/logout-1--arrow-exit-frame-leave-logout-rectangle-right.png'),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
            TopBar(),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String title, String iconPath) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(54, 158, 158, 158),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 0), // يحدد اتجاه الظل
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/Vector.png",
              width: 18,
              height: 18,
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor),
              ),
            ),
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
