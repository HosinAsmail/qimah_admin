import 'package:flutter/material.dart';
import 'package:qimah_admin/core/shared/custom_floating_action_button.dart';
import 'package:qimah_admin/core/shared/handle_Floating_ActionButtonPress.dart';
import 'package:qimah_admin/core/shared/search_text_field.dart';
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
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          handleFloatingActionButtonPress(context);
        },
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
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
          const TopBar(
            text: "المشرفين",
          ),
        ],
      ),
    );
  }
}
