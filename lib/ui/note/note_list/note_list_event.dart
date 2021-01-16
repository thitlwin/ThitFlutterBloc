import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/data/model/note.dart';
import 'package:thit_flutter_bloc/repository/note_repository.dart';
import 'package:thit_flutter_bloc/ui/note/note_list/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NoteListEvent {
  final _noteRepository = NoteRepository();
  Stream<NoteListState> applyAsync(
      {NoteListState currentState, NoteListBloc bloc});
}

class UnNoteListEvent extends NoteListEvent {
  @override
  Stream<NoteListState> applyAsync({NoteListState currentState, NoteListBloc bloc}) async* {
    yield UnNoteListState();
  }
}

class LoadNoteListEvent extends NoteListEvent {
   
  @override
  Stream<NoteListState> applyAsync(
      {NoteListState currentState, NoteListBloc bloc}) async* {
    try {
      yield UnNoteListState();
      List<Note> noteList = await _noteRepository.loadNote();
      yield InNoteListState(noteList: noteList);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadNoteListEvent', error: _, stackTrace: stackTrace);
      yield ErrorNoteListState( _?.toString());
    }
  }
}
