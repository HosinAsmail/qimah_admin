import 'package:flutter/material.dart';
import 'package:qimah_admin/core/shared/custom_floating_action_button.dart';
import 'package:qimah_admin/core/shared/handle_Floating_ActionButtonPress.dart';
import 'package:qimah_admin/core/shared/search_text_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/widget/mosque/students/students_card.dart';

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
                    itemCount: studentsData.length,
                    itemBuilder: (context, index) {
                      return StudentsCard(
                        title: studentsData[index]["title"]!,
                        description: studentsData[index]["description"]!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const TopBar(
            text: "الطلاب",
          ),
        ],
      ),
    );
  }
}
