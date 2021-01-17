import 'dart:async';
import 'dart:developer' as developer;
import 'package:thit_flutter_bloc/repository/speaker_repository.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_list/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SpeakerListEvent {
  final _speakerRepository = SpeakerRepository();
  Stream<SpeakerListState> applyAsync(
      {SpeakerListState currentState, SpeakerListBloc bloc});
}

class UnSpeakerListEvent extends SpeakerListEvent {
  @override
  Stream<SpeakerListState> applyAsync({SpeakerListState currentState, SpeakerListBloc bloc}) async* {
    yield UnSpeakerListState();
  }
}

class LoadSpeakerListEvent extends SpeakerListEvent {
   
  @override
  Stream<SpeakerListState> applyAsync(
      {SpeakerListState currentState, SpeakerListBloc bloc}) async* {
    try {
      // yield UnSpeakerListState();
      // List<Speaker> speakerList = await _speakerRepository.sp();
      // yield InSpeakerListState(speakerList: speakerList);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadSpeakerListEvent', error: _, stackTrace: stackTrace);
      yield ErrorSpeakerListState( _?.toString());
    }
  }
}
