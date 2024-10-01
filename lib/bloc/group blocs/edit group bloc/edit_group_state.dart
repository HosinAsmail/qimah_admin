part of 'edit_group_bloc.dart';

/// Represents the state of EditGroup in the application.

// ignore_for_file: must_be_immutable
class EditGroupState extends Equatable {
  const EditGroupState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EditGroupInitial extends EditGroupState {}

class EditGroupLoading extends EditGroupState {}

class EditGroupFailure extends EditGroupState {
  final String errorMessage;
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
  const EditGroupFailure(this.errorMessage);
}

class EditGroupSuccess extends EditGroupState {
}
