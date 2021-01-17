import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/data/model/audio.dart';
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

class InAudioListEvent extends AudioListEvent {
  final List<Audio> audioList;

  InAudioListEvent(this.audioList);
  @override
  Stream<AudioListState> applyAsync(
      {AudioListState currentState, AudioListBloc bloc}) async* {
    if (audioList != null) {
      yield InAudioListState(audioList);
    } else {
      yield ErrorAudioListState("Fail to download audio list.");
    }
  }
}

class LoadAudioListEvent extends AudioListEvent {
  @override
  Stream<AudioListState> applyAsync(
      {AudioListState currentState, AudioListBloc bloc}) async* {
    try {
      yield UnAudioListState();
      _todosSubscription?.cancel();
      _audioRepository.getAudioListStream().listen((event) {
        bloc.add(InAudioListEvent(event));
      });
      // var res = await _audioRepository.getAudioList();
      // if (res != null) {
      //   print(res.length);
      //   yield InAudioListState(res);
      // } else
      //   yield ErrorAudioListState("Fail to download audio list.");
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAudioListEvent', error: _, stackTrace: stackTrace);
      yield ErrorAudioListState(_?.toString());
    }
  }
}
