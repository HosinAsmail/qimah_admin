part of 'get_course_bloc.dart';

/// Represents the state of GetCourse in the application.

// ignore_for_file: must_be_immutable
class GetCourseState extends Equatable {
  const GetCourseState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCourseInitial extends GetCourseState {}

class GetCourseLoading extends GetCourseState {}

class GetCourseFailure extends GetCourseState {
  final String errorMessage;
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
  const GetCourseFailure(this.errorMessage);
}

class GetCourseSuccess extends GetCourseState {
  final List<CourseModel> courses;
  const GetCourseSuccess({required this.courses});
  @override
  // TODO: implement props
  List<Object?> get props => courses;
}
