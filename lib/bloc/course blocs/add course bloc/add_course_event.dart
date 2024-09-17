part of 'add_course_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddCourse widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class AddCourseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the AddCourse widget is first created.
class AddCourseInitialEvent extends AddCourseEvent {
  @override
  List<Object?> get props => [];
}

class AddCoursePressedEvent extends AddCourseEvent {
  @override
  List<Object?> get props => [];
}
