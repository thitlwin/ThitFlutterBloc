import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/data/model/audio.dart';
import 'package:thit_flutter_bloc/repository/audio_repository.dart';
import 'package:thit_flutter_bloc/ui/audio/audio_create/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AudioCreateEvent {
  AudioRepository _audioRepository = new AudioRepository();
  Stream<AudioCreateState> applyAsync(
      {AudioCreateState currentState, AudioCreateBloc bloc});
}

class UnAudioCreateEvent extends AudioCreateEvent {
  @override
  Stream<AudioCreateState> applyAsync(
      {AudioCreateState currentState, AudioCreateBloc bloc}) async* {
    yield UnAudioCreateState();
  }
}

class LoadAudioCreateEvent extends AudioCreateEvent {
  @override
  Stream<AudioCreateState> applyAsync(
      {AudioCreateState currentState, AudioCreateBloc bloc}) async* {
    try {
      yield UnAudioCreateState();
      await Future.delayed(Duration(seconds: 1));
      yield InAudioCreateState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAudioCreateEvent', error: _, stackTrace: stackTrace);
      yield ErrorAudioCreateState(_?.toString());
    }
  }
}

class DoAudioCreateEvent extends AudioCreateEvent {
  final Audio audio;

  DoAudioCreateEvent(this.audio);

  @override
  Stream<AudioCreateState> applyAsync(
      {AudioCreateState currentState, AudioCreateBloc bloc}) async* {
    try {
      yield UnAudioCreateState();
      var res = await _audioRepository.addAudio(this.audio);
      if (res != null)
        yield SuccessAudioCreateState("Success");
      else
        yield ErrorAudioCreateState('Fail to create.');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadAudioCreateEvent', error: _, stackTrace: stackTrace);
      yield ErrorAudioCreateState(_?.toString());
    }
  }
}
