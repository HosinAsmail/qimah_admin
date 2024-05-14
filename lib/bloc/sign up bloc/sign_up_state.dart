part of 'sign_up_bloc.dart';

/// Represents the state of SignUp in the application.

// ignore_for_file: must_be_immutable
class SignUpState extends Equatable {
  const SignUpState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String errorMessage;
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
  const SignUpFailure(this.errorMessage);
}

class SignUpSuccess extends SignUpState {
  const SignUpSuccess();
}
