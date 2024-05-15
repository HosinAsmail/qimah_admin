import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/data/data%20source/repo/auth%20repo/auth_repo.dart';
import 'package:qimah_admin/data/model/auth%20models/login_model.dart';
part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepo authRepo;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  LoginBloc(this.authRepo) : super(LoginInitial()) {
    on<LoginInitialEvent>(_onInitialize);
    on<LoginPressedEvent>(_onPressed);
  }

  _onPressed(
    LoginPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    LoginModel loginModel = LoginModel(
      password: passwordController.text,
      email: emailController.text,
    );
    var result = await authRepo.login(loginModel);
    result.fold((failure) {
      emit(LoginFailure(failure.errMessage));
    }, (_) {
      emit(const LoginSuccess());
    });
  }

  _onInitialize(
    LoginInitialEvent event,
    Emitter<LoginState> emit,
  ) async {}
}
