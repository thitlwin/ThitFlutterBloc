import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_delete/index.dart';

class GenreDeleteBloc extends Bloc<GenreDeleteEvent, GenreDeleteState> {

  GenreDeleteBloc(GenreDeleteState initialState) : super(initialState);

  @override
  Stream<GenreDeleteState> mapEventToState(
    GenreDeleteEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'GenreDeleteBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
