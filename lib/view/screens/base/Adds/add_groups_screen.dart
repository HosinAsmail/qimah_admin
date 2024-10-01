import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/bloc/group%20blocs/add%20group%20bloc/add_group_bloc.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/constant/app_int.dart';
import 'package:qimah_admin/core/helper/functions/alert_loading.dart';
import 'package:qimah_admin/core/helper/functions/close_loading_dialog.dart';
import 'package:qimah_admin/core/helper/functions/my_snack_bar.dart';
import 'package:qimah_admin/core/helper/functions/valid_input_function.dart';
import 'package:qimah_admin/core/shared/buttons/custom_elevated_button.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:toastification/toastification.dart';

class AddGroupsScreen extends StatelessWidget {
  const AddGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddGroupBloc addGroupBloc = context.read<AddGroupBloc>();
    addGroupBloc.add(AddGroupInitialEvent());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AddGroupBloc, AddGroupState>(
        listener: (context, state) {
          if (state is AddGroupFailure) {
            closeLoadingDialog();
            mySnackBar(ToastificationType.error, "خطأ", state.errorMessage);
          } else if (state is AddGroupSuccess) {
            closeLoadingDialog();
            Get.back();
            mySnackBar(
                ToastificationType.success, 'نجاح', 'تم إضافة حلقة بنجاح');
          } else if (state is AddGroupLoading) {
            alertLoading();
          }
        },
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
                      validator: (value) {
                        return validInput(value!.trim(), 3, 20,
                            'name'); // do not forget this 😀
                      },
                      hintText: 'أدخل اسم الحلقة',
                      controller: addGroupBloc.groupNameController,
                      label: 'الاسم',
                      iconData: Icons.group,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return validInput(value!.trim(), 3, 200,
                            'name'); // do not forget this 😀
                      },
                      hintText: 'أدخل وصف الحلقة',
                      controller: addGroupBloc.groupDescController,
                      label: 'وصف الحلقة',
                      iconData: Icons.description,
                    ),
                    const SizedBox(height: 16),
                    CustomElevatedButton(
                      text: "إضافة الحلقة",
                      onPressed: () {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          addGroupBloc.add(AddGroupPressedEvent());
                        }
                      },
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
            const TopBar(
              text: "إضافة الحلقة",
            ),
          ],
        ),
      ),
    );
  }
}
