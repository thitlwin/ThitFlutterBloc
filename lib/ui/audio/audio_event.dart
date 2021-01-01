import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/ui/audio/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AudioEvent {
  Stream<AudioState> applyAsync(
      {AudioState currentState, AudioBloc bloc});
}

class UnAudioEvent extends AudioEvent {
  @override
  Stream<AudioState> applyAsync({AudioState currentState, AudioBloc bloc}) async* {
    yield UnAudioState();
  }
}

class LoadAudioEvent extends AudioEvent {
   
  @override
  Stream<AudioState> applyAsync(
      {AudioState currentState, AudioBloc bloc}) async* {
    try {
      yield UnAudioState();
      await Future.delayed(Duration(seconds: 1));
      yield InAudioState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadAudioEvent', error: _, stackTrace: stackTrace);
      yield ErrorAudioState( _?.toString());
    }
  }
}
