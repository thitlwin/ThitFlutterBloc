import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/repository/audio_repository.dart';
import 'package:thit_flutter_bloc/ui/audio/audio_list/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AudioListEvent {
  AudioRepository _audioRepository = new AudioRepository();
  StreamSubscription _todosSubscription;
  Stream<AudioListState> applyAsync(
      {AudioListState currentState, AudioListBloc bloc});
}

class UnAudioListEvent extends AudioListEvent {
  @override
  Stream<AudioListState> applyAsync(
      {AudioListState currentState, AudioListBloc bloc}) async* {
    yield UnAudioListState();
  }
}

class LoadAudioListEvent extends AudioListEvent {
  @override
  Stream<AudioListState> applyAsync(
      {AudioListState currentState, AudioListBloc bloc}) async* {
    try {
      yield UnAudioListState();
      _todosSubscription?.cancel();
      _todosSubscription = _audioRepository
          .getAudioList()
          .listen((audios) => InAudioListState(audios));
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAudioListEvent', error: _, stackTrace: stackTrace);
      yield ErrorAudioListState(_?.toString());
    }
  }
}
