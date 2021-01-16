import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/note/note_list/index.dart';

class NoteListBloc extends Bloc<NoteListEvent, NoteListState> {

  NoteListBloc(NoteListState initialState) : super(initialState);

  @override
  Stream<NoteListState> mapEventToState(
    NoteListEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'NoteListBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
