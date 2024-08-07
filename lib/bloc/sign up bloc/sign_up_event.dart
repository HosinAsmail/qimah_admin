part of 'sign_up_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SignUp widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the SignUp widget is first created.
class SignUpInitialEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}

class SignUpPressedEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}
