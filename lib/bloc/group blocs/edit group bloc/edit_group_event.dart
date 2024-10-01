part of 'edit_group_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///EditGroup widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class EditGroupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the EditGroup widget is first created.
class EditGroupInitialEvent extends EditGroupEvent {
  @override
  List<Object?> get props => [];
}

class EditGroupPressedEvent extends EditGroupEvent {
  final int groupId;

  EditGroupPressedEvent({required this.groupId});

  @override
  List<Object?> get props => [];
}
