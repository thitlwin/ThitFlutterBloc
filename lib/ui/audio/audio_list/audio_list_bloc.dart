import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/audio/audio_list/index.dart';

class AudioListBloc extends Bloc<AudioListEvent, AudioListState> {

  AudioListBloc(AudioListState initialState) : super(initialState);

  @override
  Stream<AudioListState> mapEventToState(
    AudioListEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'AudioListBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
