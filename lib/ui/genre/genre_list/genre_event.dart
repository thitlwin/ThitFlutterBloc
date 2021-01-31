import 'dart:async';
import 'dart:developer' as developer;

import 'package:thit_flutter_bloc/data/model/genre.dart';
import 'package:thit_flutter_bloc/repository/genre_repository.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_list/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GenreListEvent {
  GenreRepository _genreRepository = new GenreRepository();
  StreamSubscription _todosSubscription;
  Stream<GenreListState> applyAsync(
      {GenreListState currentState, GenreListBloc bloc});
}

class UnGenreListEvent extends GenreListEvent {
  @override
  Stream<GenreListState> applyAsync(
      {GenreListState currentState, GenreListBloc bloc}) async* {
    yield UnGenreListState();
  }
}

class InGenreListEvent extends GenreListEvent {
  final List<Genre> genreList;

  InGenreListEvent(this.genreList);
  @override
  Stream<GenreListState> applyAsync(
      {GenreListState currentState, GenreListBloc bloc}) async* {
    if (genreList != null) {
      yield InGenreListState(genreList);
    } else {
      yield ErrorGenreListState("Fail to download genre list.");
    }
  }
}

class LoadGenreListEvent extends GenreListEvent {
  @override
  Stream<GenreListState> applyAsync(
      {GenreListState currentState, GenreListBloc bloc}) async* {
    try {
      yield UnGenreListState();
      _todosSubscription?.cancel();
      _genreRepository.getGenreListStream().listen((genreList) {
        bloc.add(InGenreListEvent(genreList));
      });
      // call without using stream
      // var res = await _genreRepository.getGenreList();
      // if (res != null) {
      //   print(res.length);
      //   yield InGenreListState(res);
      // } else
      //   yield ErrorGenreListState("Fail to download genre list.");
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadGenreListEvent', error: _, stackTrace: stackTrace);
      yield ErrorGenreListState(_?.toString());
    }
  }
}
