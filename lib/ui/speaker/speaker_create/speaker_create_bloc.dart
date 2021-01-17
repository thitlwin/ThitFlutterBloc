import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_create/index.dart';

class SpeakerCreateBloc extends Bloc<SpeakerCreateEvent, SpeakerCreateState> {

  SpeakerCreateBloc(SpeakerCreateState initialState) : super(initialState);

  @override
  Stream<SpeakerCreateState> mapEventToState(
    SpeakerCreateEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'SpeakerCreateBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
