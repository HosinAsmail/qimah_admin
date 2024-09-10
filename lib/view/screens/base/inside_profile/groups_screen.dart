import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/shared/search_text_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/widget/profile/profile_card.dart';

class GroupsScreen extends StatelessWidget {
  final List<Map<String, String>> GroupsData = [
    {"title": "حلقة تحفيظ القرآن", "description": "الأستاذ محمد أحمد"},
    {"title": "حلقة التجويد", "description": "الأستاذة فاطمة علي"},
    {"title": "حلقة التفسير", "description": "الأستاذ خالد عمر"},
    {"title": "حلقة السيرة النبوية", "description": "الأستاذ عبدالله محمود"},
    {"title": "حلقة الفقه", "description": "الأستاذة زينب حسن"},
    // يمكنك إضافة المزيد من الحلقات هنا
  ];
  GroupsScreen({super.key});
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
                  itemCount: GroupsData.length,
                  itemBuilder: (context, index) {
                    return StudentCard(
                      title: GroupsData[index]["title"]!,
                      description: GroupsData[index]["description"]!,
                    );
                  },
                ),
              ),
            ],
          ),
          TopBar(
            text: "الحلقات",
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
