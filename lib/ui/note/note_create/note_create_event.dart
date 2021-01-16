import 'dart:async';
import 'dart:developer' as developer;
import 'package:thit_flutter_bloc/data/model/note.dart';
import 'package:thit_flutter_bloc/repository/note_repository.dart';
import 'package:thit_flutter_bloc/ui/note/note_create/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NoteCreateEvent {
  final _noteRepository = NoteRepository();
  Stream<NoteCreateState> applyAsync(
      {NoteCreateState currentState, NoteCreateBloc bloc});
}

class UnNoteCreateEvent extends NoteCreateEvent {
  @override
  Stream<NoteCreateState> applyAsync({NoteCreateState currentState, NoteCreateBloc bloc}) async* {
    yield UnNoteCreateState();
  }
}

class LoadNoteCreateEvent extends NoteCreateEvent {
   
  @override
  Stream<NoteCreateState> applyAsync(
      {NoteCreateState currentState, NoteCreateBloc bloc}) async* {
    try {
      yield UnNoteCreateState();
      await Future.delayed(Duration(seconds: 1));
      yield InNoteCreateState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadNoteCreateEvent', error: _, stackTrace: stackTrace);
      yield ErrorNoteCreateState( _?.toString());
    }
  }
}

class DoNoteCreateEvent extends NoteCreateEvent {
  final Note note;
  DoNoteCreateEvent({this.note});

  @override
  List<Object> get props => [note];

  @override
  Stream<NoteCreateState> applyAsync(
      {NoteCreateState currentState, NoteCreateBloc bloc}) async* {
    try {
      yield UnNoteCreateState();
      var res = await _noteRepository.saveNote(note);
      print(res);
      if (res > 0) {
        yield SuccessNoteCreateState();
      } else
        yield ErrorNoteCreateState("Fail to create Note.");
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'DoNoteCreateEvent', error: _, stackTrace: stackTrace);
      yield ErrorNoteCreateState(_?.toString());
    }
  }
}
