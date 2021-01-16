import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/ui/genre/genre_list/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GenreListEvent {
  Stream<GenreListState> applyAsync(
      {GenreListState currentState, GenreListBloc bloc});
}

class UnGenreListEvent extends GenreListEvent {
  @override
  Stream<GenreListState> applyAsync({GenreListState currentState, GenreListBloc bloc}) async* {
    yield UnGenreListState();
  }
}

class LoadGenreListEvent extends GenreListEvent {
   
  @override
  Stream<GenreListState> applyAsync(
      {GenreListState currentState, GenreListBloc bloc}) async* {
    try {
      yield UnGenreListState();
      await Future.delayed(Duration(seconds: 1));
      yield InGenreListState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadGenreListEvent', error: _, stackTrace: stackTrace);
      yield ErrorGenreListState( _?.toString());
    }
  }
}
