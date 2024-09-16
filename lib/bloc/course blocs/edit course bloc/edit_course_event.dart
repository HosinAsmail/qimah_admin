part of 'edit_course_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///EditCourse widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class EditCourseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the EditCourse widget is first created.
class EditCourseInitialEvent extends EditCourseEvent {
  @override
  List<Object?> get props => [];
}

class EditCoursePressedEvent extends EditCourseEvent {
  final int courseId;

  EditCoursePressedEvent({required this.courseId});

  @override
  List<Object?> get props => [];
}
