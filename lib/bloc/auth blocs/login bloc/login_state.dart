part of 'login_bloc.dart';

class LoginFailure extends LoginState {
  final String errorMessage;
  const LoginFailure(this.errorMessage);
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

/// Represents the state of Login in the application.

// ignore_for_file: must_be_immutable
class LoginState extends Equatable {
  const LoginState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}
