part of 'add_group_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddGroup widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class AddGroupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the AddGroup widget is first created.
class AddGroupInitialEvent extends AddGroupEvent {
  @override
  List<Object?> get props => [];
}

class AddGroupPressedEvent extends AddGroupEvent {
  @override
  List<Object?> get props => [];
}
