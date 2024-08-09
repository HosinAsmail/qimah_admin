import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/bloc/login%20bloc/login_bloc.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/constant/app_routes.dart';
import 'package:qimah_admin/core/device/device_utility.dart';
import 'package:qimah_admin/core/helper/functions/alert_loading.dart';
import 'package:qimah_admin/core/helper/functions/close_loading_dialog.dart';
import 'package:qimah_admin/core/helper/functions/valid_input_function.dart';
import 'package:qimah_admin/core/shared/buttons/custom_elevated_button.dart';
import 'package:qimah_admin/core/shared/custom_image_view.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import '../../core/helper/functions/my_snack_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = context.read<LoginBloc>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              closeLoadingDialog();
              mySnackBar(AppColor.failure, "خطأ", state.errorMessage);
            } else if (state is LoginSuccess) {
              closeLoadingDialog();
              Get.offAllNamed(AppRoute.loginScreen);
              mySnackBar(AppColor.success, 'نجاح', 'تم تسجيل الدخول');
            } else if (state is LoginLoading) {
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
                  SizedBox(height: Get.height / 7),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "mmmmmسجل الدخول إلى حسابك",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: loginBloc.emailController,
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
                    controller: loginBloc.passwordController,
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
                  CustomElevatedButton(
                    text: "تسجيل الدخول",
                    onPressed: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        loginBloc.add(LoginPressedEvent());
                      }
                    },
                  ),
                  SizedBox(height: AppDevice.getScreenHeight() / 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          "ليس لديك حساب؟ ",
                          style: Theme.of(context).textTheme.labelSmall!,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoute.signUpScreen);
                        },
                        child: Text(
                          "إنشاء حساب",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: AppColor.secondaryColor),
                        ),
                      ),
                    ],
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
