part of 'create_mosque_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CreateMosque widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class CreateMosqueEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the CreateMosque widget is first created.
class CreateMosqueInitialEvent extends CreateMosqueEvent {
  @override
  List<Object?> get props => [];
}

class CreateMosquePressedEvent extends CreateMosqueEvent {
  @override
  List<Object?> get props => [];
}
