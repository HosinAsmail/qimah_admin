import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/widget/profile/profile_card.dart';

class BossesScreen extends StatelessWidget {
  final List<Map<String, String>> bossesData = [
    {
      "title": "الأستاذ محمد أحمد",
      "description": "هنا يكتب مهمة المشرف في الدورة"
    },
    {
      "title": "الأستاذة فاطمة علي",
      "description": "هنا يكتب مهمة المشرف في الدورة"
    },
    {
      "title": "الأستاذ خالد عمر",
      "description": "هنا يكتب مهمة المشرف في الدورة"
    },
    {
      "title": "الأستاذ عبدالله محمود",
      "description": "هنا يكتب مهمة المشرف في الدورة"
    },
    {
      "title": "الأستاذة زينب حسن",
      "description": "هنا يكتب مهمة المشرف في الدورة"
    },

    // يمكنك إضافة المزيد من الحلقات هنا
  ];
  BossesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextFormField(
                  borderDecoration: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  textDirection: TextDirection.rtl,
                  validator: (value) {
                    return null;
                  },
                  label: 'ابحث هنا...',
                  iconData: Icons.search,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: bossesData.length,
                  itemBuilder: (context, index) {
                    return StudentCard(
                      title: bossesData[index]["title"]!,
                      description: bossesData[index]["description"]!,
                    );
                  },
                ),
              ),
            ],
          ),
          TopBar(
            text: "المشرفين",
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
