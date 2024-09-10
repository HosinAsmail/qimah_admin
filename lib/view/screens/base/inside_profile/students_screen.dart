import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/shared/search_text_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/widget/profile/profile_card.dart';

class StudentsScreen extends StatelessWidget {
  final List<Map<String, String>> studentsData = [
    {
      "title": "محمد أحمد",
      "description": "هنا يكتب شرح بسيط عن انجاز الطالب لا يتجاوز العشر كلمات"
    },
    {
      "title": "علي",
      "description": "هنا يكتب شرح بسيط عن انجاز الطالب لا يتجاوز العشر كلمات"
    },
    {
      "title": "خالد عمر",
      "description": "هنا يكتب شرح بسيط عن انجاز الطالب لا يتجاوز العشر كلمات"
    },
    {
      "title": "عبدالله محمود",
      "description": "هنا يكتب شرح بسيط عن انجاز الطالب لا يتجاوز العشر كلمات"
    },
    {
      "title": "حسن",
      "description": "هنا يكتب شرح بسيط عن انجاز الطالب لا يتجاوز العشر كلمات"
    },
    {
      "title": "حسن",
      "description": "هنا يكتب شرح بسيط عن انجاز الطالب لا يتجاوز العشر كلمات"
    },
    {
      "title": "حسن",
      "description": "هنا يكتب شرح بسيط عن انجاز الطالب لا يتجاوز العشر كلمات"
    },
    {
      "title": "حسن",
      "description": "هنا يكتب شرح بسيط عن انجاز الطالب لا يتجاوز العشر كلمات"
    },
    {
      "title": "حسن",
      "description": "هنا يكتب شرح بسيط عن انجاز الطالب لا يتجاوز العشر كلمات"
    },
    {
      "title": "حسن",
      "description": "هنا يكتب شرح بسيط عن انجاز الطالب لا يتجاوز العشر كلمات"
    },
    {
      "title": "حسن",
      "description": "هنا يكتب شرح بسيط عن انجاز الطالب لا يتجاوز العشر كلمات"
    },
    // يمكنك إضافة المزيد من الحلقات هنا
  ];
  StudentsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 100),
              const SearchTextField(),
              Expanded(
                child: ListView.builder(
                  itemCount: studentsData.length,
                  itemBuilder: (context, index) {
                    return StudentCard(
                      title: studentsData[index]["title"]!,
                      description: studentsData[index]["description"]!,
                    );
                  },
                ),
              ),
            ],
          ),
          TopBar(
            text: "الطلاب",
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
