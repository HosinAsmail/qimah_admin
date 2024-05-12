part of 'sign_up_bloc.dart';

/// Represents the state of SignUp in the application.

// ignore_for_file: must_be_immutable
class SignUpState extends Equatable {
  SignUpState(
      {this.usernameController,
      this.emailController,
      this.passwordController,
      this.passwordConfirmController,
      this.phoneNumberController,
      this.signUpModel});

  TextEditingController? usernameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;
  TextEditingController? passwordConfirmController;

  TextEditingController? phoneNumberController;

  SignUpModel? signUpModel;

  @override
  List<Object?> get props => [
        usernameController,
        emailController,
        passwordConfirmController,
        passwordController,
        phoneNumberController,
        signUpModel
      ];
  SignUpState copyWith({
    TextEditingController? usernameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? passwordConfirmController,
    TextEditingController? phoneNumberController,
    SignUpModel? signUpModel,
  }) {
    return SignUpState(
      passwordConfirmController:
          passwordConfirmController ?? this.passwordConfirmController,
      usernameController: usernameController ?? this.usernameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      signUpModel: signUpModel ?? signUpModel,
    );
  }
}
