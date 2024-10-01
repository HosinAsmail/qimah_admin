part of 'get_group_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///GetGroup widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class GetGroupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the GetGroup widget is first created.
class GetGroupInitialEvent extends GetGroupEvent {
  @override
  List<Object?> get props => [];
}

class GetGroupPressedEvent extends GetGroupEvent {}
