import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/constant/app_int.dart';
import 'package:qimah_admin/core/shared/buttons/custom_elevated_button.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

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
                  const SizedBox(height: 130),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.shadow,
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.shadow,
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                width: 38,
                                height: 38,
                                child: Material(
                                  color: const Color.fromARGB(0, 158, 158, 158),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    splashColor: const Color.fromARGB(
                                        162, 255, 255, 255),
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.edit_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    // Image.asset(
                                    //   Assets.assetsImagesEdit,
                                    //   // color: AppColor.secondaryColor,
                                    // ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Stack(
                    children: [
                      CustomTextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 45, 25, 24),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          return null;
                        },
                        hintText: "عمار محمد نعيم نشاوي",
                        prefix: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 23, 0),
                          child: Image.asset(
                            Assets.assetsImagesPerson3,
                            width: 16,
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 25,
                        top: 8,
                        child: Text(
                          'اسم الطالب الكامل',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Stack(
                            children: [
                              CustomTextFormField(
                                textAlignVertical: TextAlignVertical.bottom,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 35, 25, 20),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  return null;
                                },
                                hintText: "20",
                              ),
                              const Positioned(
                                right: 25,
                                top: 8,
                                child: Text(
                                  "العمر",
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Stack(
                            children: [
                              CustomTextFormField(
                                textAlignVertical: TextAlignVertical.bottom,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 35, 25, 20),
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  return null;
                                },
                                hintText: "2000/12/31",
                              ),
                              const Positioned(
                                right: 25,
                                top: 8,
                                child: Text(
                                  "تاريخ الإضافة",
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    text: "تحديث بيانات الملف الشخصي",
                    onPressed: () {
                      // formKey.currentState!.save();
                      // if (formKey.currentState!.validate()) {
                      //   loginBloc.add(LoginPressedEvent());
                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
          const TopBar(
            text: 'الحساب الشخصي',
          ),
        ],
      ),
    );
  }
}
