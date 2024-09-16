import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/bloc/mosque%20blocs/create%20mosque%20bloc/create_mosque_bloc.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_routes.dart';
import 'package:qimah_admin/core/helper/functions/alert_loading.dart';
import 'package:qimah_admin/core/helper/functions/close_loading_dialog.dart';
import 'package:qimah_admin/core/helper/functions/valid_input_function.dart';
import 'package:qimah_admin/core/shared/buttons/custom_elevated_button.dart';
import 'package:qimah_admin/core/shared/custom_image_view.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:qimah_admin/view/widget/mosque/choose_gender_radio_button.dart';
import 'package:toastification/toastification.dart';

import '../../core/helper/functions/my_snack_bar.dart';

class CreateMosqueScreen extends StatelessWidget {
  const CreateMosqueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateMosqueBloc createMosqueBloc = context.read<CreateMosqueBloc>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<CreateMosqueBloc, CreateMosqueState>(
          listener: (context, state) {
            if (state is CreateMosqueFailure) {
              closeLoadingDialog();
              mySnackBar(ToastificationType.error, "خطأ", state.errorMessage);
            } else if (state is CreateMosqueSuccess) {
              closeLoadingDialog();
              Get.offAllNamed(AppRoute.baseScreen);
              mySnackBar(
                  ToastificationType.success, 'نجاح', 'تم  إنشاء المسجد');
            } else if (state is CreateMosqueLoading) {
              alertLoading();
            }
          },
          child: Form(
            key: formKey,
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: ListView(
                children: [
                  const SizedBox(height: 70.0),
                  CustomImageView(
                    alignment: Alignment.center,
                    imagePath: Assets.assetsImagesQimahLogo,
                    height: 77,
                    width: 72,
                  ),
                  const SizedBox(height: 9),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "أنشئ حسابك",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: createMosqueBloc.mosqueNameController,
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return validInput(value!.trim(), 3, 20, 'name');
                    },
                    hintText: 'أدخل اسم المسجد',
                    label: 'اسم المسجد',
                    iconData: Icons.mosque,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: createMosqueBloc.zoneController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return validInput(value!.trim(), 3, 100, 'name');
                    },
                    hintText: "أدخل اسم المنطقة",
                    label: "اسم المنطقة",
                    iconData: Icons.place,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: createMosqueBloc.courseNameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return validInput(value!.trim(), 3, 30, 'name');
                    },
                    hintText: 'أدخل اسم الدورة',
                    label: 'اسم الدورة',
                    iconData: Icons.description,
                  ),
                  const SizedBox(height: 16),
                  const ChooseGenderRadioButton(),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    text: "إنشاء الحساب",
                    onPressed: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        createMosqueBloc.add(CreateMosquePressedEvent());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
