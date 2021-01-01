import 'package:equatable/equatable.dart';

abstract class AudioState extends Equatable {

  final List propss;
  AudioState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnAudioState extends AudioState {

  UnAudioState();

  @override
  String toString() => 'UnAudioState';
}

/// Initialized
class InAudioState extends AudioState {
  final String hello;

  InAudioState(this.hello) : super([hello]);

  @override
  String toString() => 'InAudioState $hello';

}

class ErrorAudioState extends AudioState {
  final String errorMessage;

  ErrorAudioState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorAudioState';
}
