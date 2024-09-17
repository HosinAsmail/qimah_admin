part of 'add_course_bloc.dart';

/// Represents the state of AddCourse in the application.

// ignore_for_file: must_be_immutable
class AddCourseState extends Equatable {
  const AddCourseState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddCourseInitial extends AddCourseState {}

class AddCourseLoading extends AddCourseState {}

class AddCourseFailure extends AddCourseState {
  final String errorMessage;
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
  const AddCourseFailure(this.errorMessage);
}

class AddCourseSuccess extends AddCourseState {
  const AddCourseSuccess();
}
