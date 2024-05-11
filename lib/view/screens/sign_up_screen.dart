import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/bloc/sign%20up%20bloc/sign_up_bloc.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
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
                  "lbl6",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 12),
              BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                selector: (state) => state.usernameController,
                builder: (context, usernameController) {
                  return CustomTextFormField(
                    controller: usernameController,
                    hintText: "lbl7",
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                selector: (state) => state.emailController,
                builder: (context, emailController) {
                  return CustomTextFormField(
                    controller: emailController,
                    hintText: "msg4",
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                selector: (state) => state.passwordController,
                builder: (context, passwordController) {
                  return CustomTextFormField(
                    controller: passwordController,
                    hintText: "lbl2",
                  );
                },
              ),
              const SizedBox(height: 16),
              Container(
                width: 302,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 19,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), // Example decoration
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "msg5",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 16),
              BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
                selector: (state) => state.phoneNumberController,
                builder: (context, phoneNumberController) {
                  return CustomTextFormField(
                    controller: phoneNumberController,
                    hintText: "lbl8",
                    textInputAction: TextInputAction.done,
                  );
                },
              ),
              const SizedBox(height: 16),
              // CustomElevatedButton(
              //   text: "lbl9",
              // ),
              const SizedBox(height: 36),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      "lbl10",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "lbl3",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
