// import 'package:equatable/equatable.dart';

// abstract class SpeakerCreateState extends Equatable {

//   final List propss;
//   SpeakerCreateState([this.propss]);

//   @override
//   List<Object> get props => (propss ?? []);
// }

// /// UnInitialized
// class UnSpeakerCreateState extends SpeakerCreateState {

//   UnSpeakerCreateState();

//   @override
//   String toString() => 'UnSpeakerCreateState';
// }

// /// Initialized
// class InSpeakerCreateState extends SpeakerCreateState {
//   final String hello;

//   InSpeakerCreateState(this.hello) : super([hello]);

//   @override
//   String toString() => 'InSpeakerCreateState $hello';

// }

// class ErrorSpeakerCreateState extends SpeakerCreateState {
//   final String errorMessage;

//   ErrorSpeakerCreateState(this.errorMessage): super([errorMessage]);
  
//   @override
//   String toString() => 'ErrorSpeakerCreateState';
// }

import 'package:equatable/equatable.dart';

abstract class SpeakerCreateState extends Equatable {
  final List propss;
  SpeakerCreateState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnSpeakerCreateState extends SpeakerCreateState {
  UnSpeakerCreateState();

  @override
  String toString() => 'UnSpeakerCreateState';
}

/// Initialized
class InSpeakerCreateState extends SpeakerCreateState {
  final String hello;

  InSpeakerCreateState(this.hello) : super([hello]);

  @override
  String toString() => 'InSpeakerCreateState $hello';
}

class ErrorSpeakerCreateState extends SpeakerCreateState {
  final String errorMessage;

  ErrorSpeakerCreateState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorSpeakerCreateState';
}

class SuccessSpeakerCreateState extends SpeakerCreateState {
  final String hello;

  SuccessSpeakerCreateState(this.hello) : super([hello]);

  @override
  String toString() => 'SuccessSpeakerCreateState $hello';
}
