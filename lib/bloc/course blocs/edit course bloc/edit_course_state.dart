part of 'edit_course_bloc.dart';

/// Represents the state of EditCourse in the application.

// ignore_for_file: must_be_immutable
class EditCourseState extends Equatable {
  const EditCourseState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EditCourseInitial extends EditCourseState {}

class EditCourseLoading extends EditCourseState {}

class EditCourseFailure extends EditCourseState {
  final String errorMessage;
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
  const EditCourseFailure(this.errorMessage);
}

class EditCourseSuccess extends EditCourseState {
  const EditCourseSuccess();
}
