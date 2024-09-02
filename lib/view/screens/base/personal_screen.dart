import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/shared/buttons/custom_elevated_button.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:qimah_admin/core/shared/bottom_bar.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(159, 158, 158, 158)
                                .withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(10)),
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  159, 158, 158, 158)
                                              .withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    width: 30,
                                    height: 30,
                                    child: Image.asset(
                                      "assets/images/pencil--change-edit-modify-pencil-write-writing.png",
                                      // color: AppColor.secondaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomTextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {},
                      label: 'اسم الطالب الكامل',
                      hintText: "عمار محمد نعيم نشاوي",
                      prefix: Image.asset(
                        "assets/images/Object (1).png",
                      ),
                      // hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                      // textStyle: TextStyle(fontSize: 15),
                      // labelStyle: TextStyle(color: Colors.green),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 8),
                            child: CustomTextFormField(
                              keyboardType: TextInputType.number,
                              validator: (value) {},
                              label: "العمر",
                              hintText: "20",
                              // hintStyle: TextStyle(
                              //     color: Colors.grey.withOpacity(0.5)),
                              // textStyle: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, right: 8),
                            child: CustomTextFormField(
                              keyboardType: TextInputType.datetime,
                              validator: (value) {},
                              label: "تاريخ الإضافة",
                              hintText: "00 / 00 / 2000",
                              // hintStyle: TextStyle(
                              //     color: Colors.grey.withOpacity(0.5)),
                              // textStyle: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomElevatedButton(
                      text: "تحديث بيانات الملف الشخصي",
                      onPressed: () {
                        // formKey.currentState!.save();
                        // if (formKey.currentState!.validate()) {
                        //   loginBloc.add(LoginPressedEvent());
                        // }
                      },
                    ),
                    // CustomElevatedButton(
                    //   text: "تحديث بيانات الملف الشخصي",
                    //   onPressed: () {},
                    //   buttonStyle: ButtonStyle(
                    //       backgroundColor:
                    //           MaterialStateProperty.all(AppColor.primaryColor)),
                    //   decoration: BoxDecoration(
                    //     // color: Color.fromARGB(255, 18, 2, 2),
                    //     borderRadius: BorderRadius.circular(10),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Color.fromARGB(54, 158, 158, 158),
                    //         spreadRadius: 5,
                    //         blurRadius: 10,
                    //         offset: Offset(0, 0), // يحدد اتجاه الظل
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            TopBar(
              text: 'الحساب الشخصي',
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
