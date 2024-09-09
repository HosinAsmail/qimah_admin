import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/widget/profile/profile_card.dart';

class RingsScreen extends StatelessWidget {
  final List<Map<String, String>> ringsData = [
    {"title": "حلقة تحفيظ القرآن", "description": "الأستاذ محمد أحمد"},
    {"title": "حلقة التجويد", "description": "الأستاذة فاطمة علي"},
    {"title": "حلقة التفسير", "description": "الأستاذ خالد عمر"},
    {"title": "حلقة السيرة النبوية", "description": "الأستاذ عبدالله محمود"},
    {"title": "حلقة الفقه", "description": "الأستاذة زينب حسن"},
    // يمكنك إضافة المزيد من الحلقات هنا
  ];
  RingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 100),
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
                  itemCount: ringsData.length,
                  itemBuilder: (context, index) {
                    return StudentCard(
                      title: ringsData[index]["title"]!,
                      description: ringsData[index]["description"]!,
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
