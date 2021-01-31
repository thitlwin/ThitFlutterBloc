import 'package:equatable/equatable.dart';
import 'package:thit_flutter_bloc/data/model/genre.dart';

abstract class GenreListState extends Equatable {
  final List propss;
  GenreListState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnGenreListState extends GenreListState {
  UnGenreListState();

  @override
  String toString() => 'UnGenreListState';
}

/// Initialized
class InGenreListState extends GenreListState {
  final List<Genre> genreList;

  InGenreListState(this.genreList) : super([genreList]);

  @override
  String toString() => 'InGenreListState $genreList';
}

class ErrorGenreListState extends GenreListState {
  final String errorMessage;

  ErrorGenreListState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorGenreListState';
}
