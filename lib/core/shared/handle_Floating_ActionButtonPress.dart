import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/constant/app_routes.dart';
import 'package:qimah_admin/core/shared/buttons/custom_elevated_button.dart';

void handleFloatingActionButtonPress(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: false,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return const SelectionBottomSheet();
    },
  );
}

class SelectionBottomSheet extends StatefulWidget {
  const SelectionBottomSheet({super.key});

  @override
  SelectionBottomSheetState createState() => SelectionBottomSheetState();
}

class SelectionBottomSheetState extends State<SelectionBottomSheet> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Wrap(
        children: <Widget>[
          const ListTile(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'اختر ما تريد إضافتة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ),
          _buildSelectionTile(
            0,
            'طالب',
            Icons.person_add_alt_1_rounded,
          ),
          _buildSelectionTile(
            1,
            'مشرف',
            Icons.person_4,
          ),
          _buildSelectionTile(
            2,
            'حلقة',
            Icons.group_add_rounded,
          ),
          _buildSelectionTile(
            3,
            'دورة',
            Icons.groups_2,
          ),
          CustomElevatedButton(
            text: "التالي",
            margin: const EdgeInsets.all(15),
            buttonTextStyle: const TextStyle(
              fontSize: 14,
            ),
            onPressed: _handleNextButton,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionTile(int index, String title, IconData icon) {
    bool isSelected = selectedIndex == index;
    return ListTile(
      tileColor: isSelected ? AppColor.primaryColor.withOpacity(0.1) : null,
      hoverColor: AppColor.primaryColor.withOpacity(0.1),
      leading: Icon(
        icon,
        color: AppColor.primaryColor,
      ),
      trailing: Icon(
        isSelected ? Icons.check_circle : Icons.circle_outlined,
        color: isSelected ? AppColor.primaryColor : null,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }

  void _handleNextButton() {
    Navigator.pop(context);
    if (selectedIndex == 0) {
      Get.toNamed(AppRoute.addStudentsScreen);
    } else if (selectedIndex == 1) {
      Get.toNamed(AppRoute.addBossesScreen);
    } else if (selectedIndex == 2) {
      Get.toNamed(AppRoute.addGroupsScreen);
    } else if (selectedIndex == 3) {
      Get.toNamed(AppRoute.addCoursesScreen);
    }
    // Add logic for other options if needed
  }
}
