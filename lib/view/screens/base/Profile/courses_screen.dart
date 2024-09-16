import 'package:flutter/material.dart';
import 'package:qimah_admin/core/shared/custom_floating_action_button.dart';
import 'package:qimah_admin/core/shared/handle_Floating_ActionButtonPress.dart';
import 'package:qimah_admin/core/shared/search_text_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/widget/profile/profile_card.dart';

class CoursesScreen extends StatelessWidget {
  final List<Map<String, String>> bossesData = [
    {"title": "دورة الأستاذ محمد", "description": "هنا يكتب مهمة الدورة"},
    {"title": "دورة الأستاذ علي", "description": "هنا يكتب مهمة الدورة"},
    {"title": "دورة الأستاذ عمر", "description": "هنا يكتب مهمة الدورة"},
    {"title": "دورة الأستاذ محمود", "description": "هنا يكتب مهمة الدورة"},
    {"title": "دورة الأستاذ حسن", "description": "هنا يكتب مهمة الدورة"},

    // يمكنك إضافة المزيد من الحلقات هنا
  ];
  CoursesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          handleFloatingActionButtonPress(context);
        },
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 100),
                const SearchTextField(),
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
          ),
          const TopBar(
            text: "الدورات",
          ),
        ],
      ),
    );
  }
}
