import 'package:equatable/equatable.dart';

abstract class AudioCreateState extends Equatable {
  final List propss;
  AudioCreateState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnAudioCreateState extends AudioCreateState {
  UnAudioCreateState();

  @override
  String toString() => 'UnAudioCreateState';
}

/// Initialized
class InAudioCreateState extends AudioCreateState {
  final String hello;

  InAudioCreateState(this.hello) : super([hello]);

  @override
  String toString() => 'InAudioCreateState $hello';
}

class ErrorAudioCreateState extends AudioCreateState {
  final String errorMessage;

  ErrorAudioCreateState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorAudioCreateState';
}

class SuccessAudioCreateState extends AudioCreateState {
  final String hello;

  SuccessAudioCreateState(this.hello) : super([hello]);

  @override
  String toString() => 'SuccessAudioCreateState $hello';
}
