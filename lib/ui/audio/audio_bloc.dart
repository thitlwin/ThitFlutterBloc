import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/audio/index.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {

  AudioBloc(AudioState initialState) : super(initialState);

  @override
  Stream<AudioState> mapEventToState(
    AudioEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'AudioBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
