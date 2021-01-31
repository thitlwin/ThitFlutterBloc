import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/ui/genre/genre_update/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GenreUpdateEvent {
  Stream<GenreUpdateState> applyAsync(
      {GenreUpdateState currentState, GenreUpdateBloc bloc});
}

class UnGenreUpdateEvent extends GenreUpdateEvent {
  @override
  Stream<GenreUpdateState> applyAsync({GenreUpdateState currentState, GenreUpdateBloc bloc}) async* {
    yield UnGenreUpdateState();
  }
}

class LoadGenreUpdateEvent extends GenreUpdateEvent {
   
  @override
  Stream<GenreUpdateState> applyAsync(
      {GenreUpdateState currentState, GenreUpdateBloc bloc}) async* {
    try {
      yield UnGenreUpdateState();
      await Future.delayed(Duration(seconds: 1));
      yield InGenreUpdateState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadGenreUpdateEvent', error: _, stackTrace: stackTrace);
      yield ErrorGenreUpdateState( _?.toString());
    }
  }
}
