import 'package:equatable/equatable.dart';
import 'package:thit_flutter_bloc/data/model/speaker.dart';

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
  final List<Speaker> speakerList;

  InAudioCreateState(this.speakerList) : super([speakerList]);

  @override
  String toString() => 'InAudioCreateState $speakerList';
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
