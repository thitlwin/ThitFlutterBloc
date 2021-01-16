import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/note/note_create/index.dart';

class NoteCreateBloc extends Bloc<NoteCreateEvent, NoteCreateState> {

  NoteCreateBloc(NoteCreateState initialState) : super(initialState);

  @override
  Stream<NoteCreateState> mapEventToState(
    NoteCreateEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'NoteCreateBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
