part of 'get_group_bloc.dart';

/// Represents the state of GetGroup in the application.

// ignore_for_file: must_be_immutable
class GetGroupState extends Equatable {
  const GetGroupState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetGroupInitial extends GetGroupState {}

class GetGroupLoading extends GetGroupState {}

class GetGroupFailure extends GetGroupState {
  final String errorMessage;
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
  const GetGroupFailure(this.errorMessage);
}

class GetGroupSuccess extends GetGroupState {
  final List<GroupModel> groups;
  const GetGroupSuccess({required this.groups});
  @override
  // TODO: implement props
  List<Object?> get props => groups;
}
