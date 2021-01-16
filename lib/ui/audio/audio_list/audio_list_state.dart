import 'package:equatable/equatable.dart';
import 'package:thit_flutter_bloc/data/model/audio.dart';

abstract class AudioListState extends Equatable {
  final List propss;
  AudioListState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnAudioListState extends AudioListState {
  UnAudioListState();

  @override
  String toString() => 'UnAudioListState';
}

/// Initialized
class InAudioListState extends AudioListState {
  final List<Audio> audioList;

  InAudioListState(this.audioList) : super([audioList]);

  @override
  String toString() => 'InAudioListState $audioList';
}

class ErrorAudioListState extends AudioListState {
  final String errorMessage;

  ErrorAudioListState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorAudioListState';
}
