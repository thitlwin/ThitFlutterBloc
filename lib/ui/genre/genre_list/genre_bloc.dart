import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_list/index.dart';

class GenreListBloc extends Bloc<GenreListEvent, GenreListState> {

  GenreListBloc(GenreListState initialState) : super(initialState);

  @override
  Stream<GenreListState> mapEventToState(
    GenreListEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'GenreListBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
