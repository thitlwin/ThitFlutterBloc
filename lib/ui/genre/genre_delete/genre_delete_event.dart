import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/data/model/genre.dart';
import 'package:thit_flutter_bloc/repository/genre_repository.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_delete/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GenreDeleteEvent {
  final _genreRepository = GenreRepository();
  Stream<GenreDeleteState> applyAsync(
      {GenreDeleteState currentState, GenreDeleteBloc bloc});
}

class UnGenreDeleteEvent extends GenreDeleteEvent {
  @override
  Stream<GenreDeleteState> applyAsync(
      {GenreDeleteState currentState, GenreDeleteBloc bloc}) async* {
    yield UnGenreDeleteState();
  }
}

class LoadGenreDeleteEvent extends GenreDeleteEvent {
  @override
  Stream<GenreDeleteState> applyAsync(
      {GenreDeleteState currentState, GenreDeleteBloc bloc}) async* {
    try {
      yield UnGenreDeleteState();
      await Future.delayed(Duration(seconds: 1));
      yield InGenreDeleteState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadGenreDeleteEvent', error: _, stackTrace: stackTrace);
      yield ErrorGenreDeleteState(_?.toString());
    }
  }
}

class DoGenreDeleteEvent extends GenreDeleteEvent {
  final Genre genre;
  DoGenreDeleteEvent({this.genre});

  @override
  List<Object> get props => [genre];

  @override
  Stream<GenreDeleteState> applyAsync(
      {GenreDeleteState currentState, GenreDeleteBloc bloc}) async* {
    try {
      yield UnGenreDeleteState();
      var res = await _genreRepository.deleteGenre(genre);
      print(res);
      if (res > 0) {
        yield SuccessGenreDeleteState();
      } else
        yield ErrorGenreDeleteState("Fail to create genre.");
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'DoGenreCreateEvent', error: _, stackTrace: stackTrace);
      yield ErrorGenreDeleteState(_?.toString());
    }
  }
}
