import 'package:flutter/material.dart';
import 'package:qimah_admin/core/shared/custom_floating_action_button.dart';
import 'package:qimah_admin/core/shared/handle_Floating_ActionButtonPress.dart';
import 'package:qimah_admin/core/shared/search_text_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/widget/profile/profile_card.dart';

class GroupsScreen extends StatelessWidget {
  final List<Map<String, String>> groupsData = [
    {"title": "حلقة تحفيظ القرآن", "description": "الأستاذ محمد أحمد"},
    {"title": "حلقة التجويد", "description": "الأستاذة فاطمة علي"},
    {"title": "حلقة التفسير", "description": "الأستاذ خالد عمر"},
    {"title": "حلقة السيرة النبوية", "description": "الأستاذ عبدالله محمود"},
    {"title": "حلقة الفقه", "description": "الأستاذة زينب حسن"},
    {"title": "حلقة الفقه", "description": "الأستاذة زينب حسن"},
    {"title": "حلقة الفقه", "description": "الأستاذة زينب حسن"},
    {"title": "حلقة الفقه", "description": "الأستاذة زينب حسن"},
    {"title": "حلقة الفقه", "description": "الأستاذة زينب حسن"},
    // يمكنك إضافة المزيد من الحلقات هنا
  ];
  GroupsScreen({super.key});
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
                  itemCount: groupsData.length,
                  itemBuilder: (context, index) {
                    return StudentCard(
                      title: groupsData[index]["title"]!,
                      description: groupsData[index]["description"]!,
                    );
                  },
                ),
              ),
            ],
          ),
          const TopBar(
            text: "الحلقات",
          ),
        ],
      ),
    );
  }
}
