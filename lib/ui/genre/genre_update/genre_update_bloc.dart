import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_update/index.dart';

class GenreUpdateBloc extends Bloc<GenreUpdateEvent, GenreUpdateState> {

  GenreUpdateBloc(GenreUpdateState initialState) : super(initialState);

  @override
  Stream<GenreUpdateState> mapEventToState(
    GenreUpdateEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'GenreUpdateBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
