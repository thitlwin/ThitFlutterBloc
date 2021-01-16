import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_create/index.dart';

class GenreCreateBloc extends Bloc<GenreCreateEvent, GenreCreateState> {

  GenreCreateBloc(GenreCreateState initialState) : super(initialState);

  @override
  Stream<GenreCreateState> mapEventToState(
    GenreCreateEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'GenreCreateBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
