import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/data/data%20source/repo/auth%20repo/auth_repo.dart';
import 'package:qimah_admin/data/model/auth%20models/sign_up_model.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

/// A bloc that manages the state of a SignUp according to the event that is dispatched to it.
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  AuthRepo authRepo;

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();
  SignUpBloc(this.authRepo) : super(SignUpInitial()) {
    on<SignUpInitialEvent>(_onInitialize);
    on<SignUpPressedEvent>(_onPressed);
  }

  _onPressed(
    SignUpPressedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());

    SignUpModel signUpModel = SignUpModel(
        name: usernameController.text,
        password: passwordController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text);
    var result = await authRepo.signUp(signUpModel);
    result.fold((failure) {
      emit(SignUpFailure(failure.errMessage));
    }, (_) {
      emit(const SignUpSuccess());
    });
  }

  _onInitialize(
    SignUpInitialEvent event,
    Emitter<SignUpState> emit,
  ) async {
    // usernameController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // passwordConfirmController = TextEditingController();
  }
}
