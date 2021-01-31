import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/data/model/genre.dart';
import 'package:thit_flutter_bloc/repository/genre_repository.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_create/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GenreCreateEvent {
  final _genreRepository = GenreRepository();
  Stream<GenreCreateState> applyAsync(
      {GenreCreateState currentState, GenreCreateBloc bloc});
}

class UnGenreCreateEvent extends GenreCreateEvent {
  @override
  Stream<GenreCreateState> applyAsync(
      {GenreCreateState currentState, GenreCreateBloc bloc}) async* {
    yield UnGenreCreateState();
  }
}

class LoadGenreCreateEvent extends GenreCreateEvent {
  @override
  Stream<GenreCreateState> applyAsync(
      {GenreCreateState currentState, GenreCreateBloc bloc}) async* {
    try {
      yield UnGenreCreateState();
      await Future.delayed(Duration(seconds: 1));
      yield InGenreCreateState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadGenreCreateEvent', error: _, stackTrace: stackTrace);
      yield ErrorGenreCreateState(_?.toString());
    }
  }
}

class DoGenreCreateEvent extends GenreCreateEvent {
  final Genre genre;
  DoGenreCreateEvent({this.genre});

  @override
  List<Object> get props => [genre];

  @override
  Stream<GenreCreateState> applyAsync(
      {GenreCreateState currentState, GenreCreateBloc bloc}) async* {
    try {
      yield UnGenreCreateState();
      var res = await _genreRepository.saveGenre(genre);
      print(res);
      if (res > 0) {
        yield SuccessGenreCreateState();
      } else
        yield ErrorGenreCreateState("Fail to create genre.");
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'DoGenreCreateEvent', error: _, stackTrace: stackTrace);
      yield ErrorGenreCreateState(_?.toString());
    }
  }
}
