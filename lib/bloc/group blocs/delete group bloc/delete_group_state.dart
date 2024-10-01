part of 'delete_group_bloc.dart';

/// Represents the state of DeleteGroup in the application.

// ignore_for_file: must_be_immutable
class DeleteGroupState extends Equatable {
  const DeleteGroupState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeleteGroupInitial extends DeleteGroupState {}

class DeleteGroupLoading extends DeleteGroupState {}

class DeleteGroupFailure extends DeleteGroupState {
  final String errorMessage;
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
  const DeleteGroupFailure(this.errorMessage);
}

class DeleteGroupSuccess extends DeleteGroupState {
}
