import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/bloc/sign%20up%20bloc/sign_up_bloc.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/shared/buttons/custom_elevated_button.dart';
import 'package:qimah_admin/core/shared/custom_image_view.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
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
              BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                selector: (state) => state.usernameController,
                builder: (context, usernameController) {
                  return CustomTextFormField(
                    controller: usernameController,
                    hintText: "اسم المستخدم",
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                selector: (state) => state.emailController,
                builder: (context, emailController) {
                  return CustomTextFormField(
                    controller: emailController,
                    hintText: "البريد الالكتروني",
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                selector: (state) => state.passwordController,
                builder: (context, passwordController) {
                  return CustomTextFormField(
                    controller: passwordController,
                    hintText: "كلمة المرور",
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                selector: (state) => state.passwordConfirmController,
                builder: (context, passwordConfirmController) {
                  return CustomTextFormField(
                    controller: passwordConfirmController,
                    hintText: "تأكيد كلمة المرور",
                    textInputAction: TextInputAction.done,
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                selector: (state) => state.phoneNumberController,
                builder: (context, phoneNumberController) {
                  return CustomTextFormField(
                    controller: phoneNumberController,
                    hintText: "رقم الهاتف",
                    textInputAction: TextInputAction.done,
                  );
                },
              ),
              const SizedBox(height: 16),
              const CustomElevatedButton(
                text: "إنشاء الحساب",
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
                  Text(
                    "تسجيل الدخول",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: AppColor.secondaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 5)
            ],
          ),
        ),
      ),
    );
  }
}
