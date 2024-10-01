part of 'add_group_bloc.dart';

/// Represents the state of AddGroup in the application.

// ignore_for_file: must_be_immutable
class AddGroupState extends Equatable {
  const AddGroupState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddGroupInitial extends AddGroupState {}

class AddGroupLoading extends AddGroupState {}

class AddGroupFailure extends AddGroupState {
  final String errorMessage;
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
  const AddGroupFailure(this.errorMessage);
}

class AddGroupSuccess extends AddGroupState {}
