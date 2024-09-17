part of 'delete_course_bloc.dart';

/// Represents the state of DeleteCourse in the application.

// ignore_for_file: must_be_immutable
class DeleteCourseState extends Equatable {
  const DeleteCourseState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeleteCourseInitial extends DeleteCourseState {}

class DeleteCourseLoading extends DeleteCourseState {}

class DeleteCourseFailure extends DeleteCourseState {
  final String errorMessage;
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
  const DeleteCourseFailure(this.errorMessage);
}

class DeleteCourseSuccess extends DeleteCourseState {
  const DeleteCourseSuccess();
}
