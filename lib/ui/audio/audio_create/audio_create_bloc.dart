import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/audio/audio_create/index.dart';

class AudioCreateBloc extends Bloc<AudioCreateEvent, AudioCreateState> {

  AudioCreateBloc(AudioCreateState initialState) : super(initialState);

  @override
  Stream<AudioCreateState> mapEventToState(
    AudioCreateEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'AudioCreateBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
