import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/constant/app_int.dart';
import 'package:qimah_admin/core/helper/functions/valid_input_function.dart';
import 'package:qimah_admin/core/shared/buttons/custom_elevated_button.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';

class AddCoursesScreen extends StatelessWidget {
  const AddCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppInt.horizontalPadding),
              child: Column(
                children: [
                  const SizedBox(height: 110),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(159, 158, 158, 158)
                              .withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.add_a_photo,
                          size: 55,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'إضافة صورة',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "أدخل البيانات التالية",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return null;
                    },
                    hintText: 'أدخل اسم الدورة',
                    label: 'الاسم',
                    iconData: Icons.group,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    // controller: createMosqueBloc.courseNameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return validInput(value!.trim(), 3, 30, 'name');
                    },
                    hintText: 'أدخل اسم الدورة',
                    label: 'اسم الدورة',
                    iconData: Icons.description,
                  ),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    text: "إضافة الدورة",
                    onPressed: () {
                      return;
                    },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
          const TopBar(
            text: "إضافة الدورة",
          ),
        ],
      ),
    );
  }
}
