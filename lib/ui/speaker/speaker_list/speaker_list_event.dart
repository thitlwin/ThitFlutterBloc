import 'dart:async';
import 'dart:developer' as developer;
import 'package:thit_flutter_bloc/data/model/speaker.dart';
import 'package:thit_flutter_bloc/repository/speaker_repository.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_list/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SpeakerListEvent {
  SpeakerRepository _speakerRepository = new SpeakerRepository();
  StreamSubscription _speakersSubscription;
  Stream<SpeakerListState> applyAsync(
      {SpeakerListState currentState, SpeakerListBloc bloc});
}

class UnSpeakerListEvent extends SpeakerListEvent {
  @override
  Stream<SpeakerListState> applyAsync(
    {SpeakerListState currentState, SpeakerListBloc bloc}) async* {
    yield UnSpeakerListState();
  }
}

class InSpeakerListEvent extends SpeakerListEvent {
  final List<Speaker> speakerList;

  InSpeakerListEvent(this.speakerList);
  @override
  Stream<SpeakerListState> applyAsync(
      {SpeakerListState currentState, SpeakerListBloc bloc}) async* {
    if (speakerList != null) {
      yield InSpeakerListState(speakerList);
    } else {
      yield ErrorSpeakerListState("Fail to download speaker list.");
    }
  }
}

class LoadSpeakerListEvent extends SpeakerListEvent {
   @override
  Stream<SpeakerListState> applyAsync(
      {SpeakerListState currentState, SpeakerListBloc bloc}) async* {
    try {
      yield UnSpeakerListState();
      _speakersSubscription?.cancel();
      _speakerRepository.getSpeakerList().listen((speakerList) {
        bloc.add(InSpeakerListEvent(speakerList));
      });
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadSpeakerListEvent', error: _, stackTrace: stackTrace);
      yield ErrorSpeakerListState(_?.toString());
    }
  }
}
