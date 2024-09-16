part of 'delete_course_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DeleteCourse widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class DeleteCourseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the DeleteCourse widget is first created.
class DeleteCourseInitialEvent extends DeleteCourseEvent {
  @override
  List<Object?> get props => [];
}

class DeleteCoursePressedEvent extends DeleteCourseEvent {
  final int mosqueId;

  DeleteCoursePressedEvent({required this.mosqueId});
  @override
  List<Object?> get props => [];
}
