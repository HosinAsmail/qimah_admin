part of 'delete_group_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DeleteGroup widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class DeleteGroupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the DeleteGroup widget is first created.
class DeleteGroupInitialEvent extends DeleteGroupEvent {
  @override
  List<Object?> get props => [];
}

class DeleteGroupPressedEvent extends DeleteGroupEvent {
  final int mosqueId;

  DeleteGroupPressedEvent({required this.mosqueId});
  @override
  List<Object?> get props => [];
}
