import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_list/index.dart';

class SpeakerListBloc extends Bloc<SpeakerListEvent, SpeakerListState> {

  SpeakerListBloc(SpeakerListState initialState) : super(initialState);

  @override
  Stream<SpeakerListState> mapEventToState(
    SpeakerListEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'SpeakerListBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
