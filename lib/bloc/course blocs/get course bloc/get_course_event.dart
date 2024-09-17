part of 'get_course_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///GetCourse widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class GetCourseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the GetCourse widget is first created.
class GetCourseInitialEvent extends GetCourseEvent {
  @override
  List<Object?> get props => [];
}

class GetCoursePressedEvent extends GetCourseEvent {}
