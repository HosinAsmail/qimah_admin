part of 'create_mosque_bloc.dart';

/// Represents the state of CreateMosque in the application.

// ignore_for_file: must_be_immutable
class CreateMosqueState extends Equatable {
  const CreateMosqueState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateMosqueInitial extends CreateMosqueState {}

class CreateMosqueLoading extends CreateMosqueState {}

class CreateMosqueFailure extends CreateMosqueState {
  final String errorMessage;
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
  const CreateMosqueFailure(this.errorMessage);
}

class CreateMosqueSuccess extends CreateMosqueState {
  const CreateMosqueSuccess();
}
