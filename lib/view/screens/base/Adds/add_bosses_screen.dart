import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/constant/app_int.dart';
import 'package:qimah_admin/core/shared/buttons/custom_elevated_button.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';

class AddBossesScreen extends StatelessWidget {
  const AddBossesScreen({super.key});

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
                    hintText: 'أدخل الاسم',
                    label: 'الاسم',
                    iconData: Icons.person,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return null;
                    },
                    hintText: 'أدخل رقم الهاتف',
                    label: 'رقم الهاتف',
                    iconData: Icons.numbers,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    // controller: loginBloc.emailController,
                    keyboardType: TextInputType.emailAddress,
                    textDirection: TextDirection.ltr,
                    validator: (value) {
                      return null;
                    },
                    hintText: "أدخل البريد الالكتروني",
                    label: "البريد الالكتروني",
                    iconData: Icons.email_outlined,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    // controller: loginBloc.passwordController,
                    obscureText: true,
                    onPressedIcon: () {},
                    keyboardType: TextInputType.visiblePassword,
                    textDirection: TextDirection.ltr,
                    validator: (value) {
                      return null;
                    },
                    hintText: 'أدخل كلمة السر',
                    label: 'كلمة السر',
                    iconData: Icons.lock_outline,
                  ),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    text: "إضافة مشرف",
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
            text: "إضافة مشرف",
          ),
        ],
      ),
    );
  }
}
