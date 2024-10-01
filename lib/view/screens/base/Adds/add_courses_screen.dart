import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/bloc/course%20blocs/add%20course%20bloc/add_course_bloc.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/constant/app_int.dart';
import 'package:qimah_admin/core/helper/functions/alert_loading.dart';
import 'package:qimah_admin/core/helper/functions/close_loading_dialog.dart';
import 'package:qimah_admin/core/helper/functions/get_gender_name.dart';
import 'package:qimah_admin/core/helper/functions/my_snack_bar.dart';
import 'package:qimah_admin/core/helper/functions/valid_input_function.dart';
import 'package:qimah_admin/core/shared/buttons/custom_elevated_button.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/core/shared/choose_gender_radio_button.dart';
import 'package:toastification/toastification.dart';

class AddCoursesScreen extends StatelessWidget {
  const AddCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddCourseBloc addCourseBloc = context.read<AddCourseBloc>();
    addCourseBloc.add(AddCourseInitialEvent());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AddCourseBloc, AddCourseState>(
        listener: (context, state) {
          if (state is AddCourseFailure) {
            closeLoadingDialog();
            mySnackBar(ToastificationType.error, "خطأ", state.errorMessage);
          } else if (state is AddCourseSuccess) {
            closeLoadingDialog();
            Get.back();
            mySnackBar(
                ToastificationType.success, 'نجاح', 'تم إضافة دورة بنجاح');
          } else if (state is AddCourseLoading) {
            alertLoading();
          }
        },
        child: Form(
          key: formKey,
          child: Stack(
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
                        controller: addCourseBloc.courseNameController,
                        validator: (value) {
                          return validInput(value!.trim(), 3, 20,
                              'name'); // do not forget this 😀
                        },
                        hintText: 'أدخل اسم الدورة',
                        label: 'الاسم',
                        iconData: Icons.group,
                      ),
                      const SizedBox(height: 16),
                      ChooseGenderRadioButton(
                        onChanged: (gender) {
                          addCourseBloc.courseGenderController.text =
                              toGenderNumber(gender).toString();
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomElevatedButton(
                        text: "إضافة الدورة",
                        onPressed: () {
                          formKey.currentState!.save();
                          if (formKey.currentState!.validate()) {
                            addCourseBloc.add(AddCoursePressedEvent());
                          }
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
        ),
      ),
    );
  }
}
