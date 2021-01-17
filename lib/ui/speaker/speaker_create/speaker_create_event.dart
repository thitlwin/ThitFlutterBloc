// import 'dart:async';
// import 'dart:developer' as developer;

// import 'package:thit_flutter_bloc/ui/speaker/speaker_create/index.dart';
// import 'package:meta/meta.dart';

// @immutable
// abstract class SpeakerCreateEvent {
//   Stream<SpeakerCreateState> applyAsync(
//       {SpeakerCreateState currentState, SpeakerCreateBloc bloc});
// }

// class UnSpeakerCreateEvent extends SpeakerCreateEvent {
//   @override
//   Stream<SpeakerCreateState> applyAsync({SpeakerCreateState currentState, SpeakerCreateBloc bloc}) async* {
//     yield UnSpeakerCreateState();
//   }
// }

// class LoadSpeakerCreateEvent extends SpeakerCreateEvent {
   
//   @override
//   Stream<SpeakerCreateState> applyAsync(
//       {SpeakerCreateState currentState, SpeakerCreateBloc bloc}) async* {
//     try {
//       yield UnSpeakerCreateState();
//       await Future.delayed(Duration(seconds: 1));
//       yield InSpeakerCreateState('Hello world');
//     } catch (_, stackTrace) {
//       developer.log('$_', name: 'LoadSpeakerCreateEvent', error: _, stackTrace: stackTrace);
//       yield ErrorSpeakerCreateState( _?.toString());
//     }
//   }
// }


import 'dart:async';
import 'dart:developer' as developer;
import 'package:meta/meta.dart';
import 'package:thit_flutter_bloc/data/model/speaker.dart';
import 'package:thit_flutter_bloc/repository/speaker_repository.dart';
import 'package:thit_flutter_bloc/ui/speaker/speaker_create/index.dart';

@immutable
abstract class SpeakerCreateEvent {
  SpeakerRepository _speakerRepository = new SpeakerRepository();
  Stream<SpeakerCreateState> applyAsync(
      {SpeakerCreateState currentState, SpeakerCreateBloc bloc});
}

class UnSpeakerCreateEvent extends SpeakerCreateEvent {
  @override
  Stream<SpeakerCreateState> applyAsync(
      {SpeakerCreateState currentState, SpeakerCreateBloc bloc}) async* {
    yield UnSpeakerCreateState();
  }
}

class LoadSpeakerCreateEvent extends SpeakerCreateEvent {
  @override
  Stream<SpeakerCreateState> applyAsync(
      {SpeakerCreateState currentState, SpeakerCreateBloc bloc}) async* {
    try {
      yield UnSpeakerCreateState();
      await Future.delayed(Duration(seconds: 1));
      yield InSpeakerCreateState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadSpeakerCreateEvent', error: _, stackTrace: stackTrace);
      yield ErrorSpeakerCreateState(_?.toString());
    }
  }
}

class DoSpeakerCreateEvent extends SpeakerCreateEvent {
  final Speaker speaker;

  DoSpeakerCreateEvent(this.speaker);

  @override
  Stream<SpeakerCreateState> applyAsync(
      {SpeakerCreateState currentState, SpeakerCreateBloc bloc}) async* {
    try {
      yield UnSpeakerCreateState();
      var res = await _speakerRepository.addSpeaker(this.speaker);
      if (res != null)
        yield SuccessSpeakerCreateState("Success");
      else
        yield ErrorSpeakerCreateState('Fail to create.');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadSpeakerCreateEvent', error: _, stackTrace: stackTrace);
      yield ErrorSpeakerCreateState(_?.toString());
    }
  }
}
