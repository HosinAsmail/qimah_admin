import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/bloc/auth%20blocs/sign%20up%20bloc/sign_up_bloc.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/constant/app_routes.dart';
import 'package:qimah_admin/core/helper/functions/alert_loading.dart';
import 'package:qimah_admin/core/helper/functions/close_loading_dialog.dart';
import 'package:qimah_admin/core/helper/functions/valid_input_function.dart';
import 'package:qimah_admin/core/shared/buttons/custom_elevated_button.dart';
import 'package:qimah_admin/core/shared/custom_image_view.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:toastification/toastification.dart';
import '../../core/helper/functions/my_snack_bar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpBloc signUpBloc = context.read<SignUpBloc>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpFailure) {
              closeLoadingDialog();
              mySnackBar(ToastificationType.error, "خطأ", state.errorMessage);
            } else if (state is SignUpSuccess) {
              closeLoadingDialog();
              Get.offAllNamed(AppRoute.createMosqueScreen);
              mySnackBar(
                  ToastificationType.success, 'نجاح', 'تم  إنشاء الحساب');
            } else if (state is SignUpLoading) {
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
                    controller: signUpBloc.usernameController,
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return validInput(value!.trim(), 3, 20, 'name');
                    },
                    hintText: 'أدخل اسم المستخدم',
                    label: 'اسم المستخدم',
                    iconData: Icons.person_outline,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: signUpBloc.emailController,
                    keyboardType: TextInputType.emailAddress,
                    textDirection: TextDirection.ltr,
                    validator: (value) {
                      return validInput(value!.trim(), 7, 100, 'email');
                    },
                    hintText: "أدخل البريد الالكتروني",
                    label: "البريد الالكتروني",
                    iconData: Icons.email_outlined,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: signUpBloc.passwordController,
                    obscureText: true,
                    onPressedIcon: () {},
                    keyboardType: TextInputType.visiblePassword,
                    textDirection: TextDirection.ltr,
                    validator: (value) {
                      return validInput(value!.trim(), 5, 30, 'password');
                    },
                    hintText: 'أدخل كلمة السر',
                    label: 'كلمة السر',
                    iconData: Icons.lock_outline,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: signUpBloc.passwordConfirmController,
                    obscureText: true,
                    onPressedIcon: () {},
                    keyboardType: TextInputType.visiblePassword,
                    textDirection: TextDirection.ltr,
                    validator: (value) {
                      return validInput(value!.trim(), 5, 30, 'password');
                    },
                    hintText: "تأكيد كلمة المرور",
                    label: "تأكيد كلمة المرور",
                    iconData: Icons.lock_outline,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: signUpBloc.phoneNumberController,
                    keyboardType: TextInputType.number,
                    textDirection: TextDirection.ltr,
                    validator: (value) {
                      return validInput(value!.trim(), 5, 10, 'phone');
                    },
                    hintText: "أدخل رقم الهاتف",
                    label: "رقم الهاتف",
                    iconData: Icons.phone,
                  ),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    text: "إنشاء الحساب",
                    onPressed: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        signUpBloc.add(SignUpPressedEvent());
                      }
                    },
                  ),
                  const SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          "يوجد لديك حساب؟ ",
                          style: Theme.of(context).textTheme.labelSmall!,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "تسجيل الدخول",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: AppColor.secondaryColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
