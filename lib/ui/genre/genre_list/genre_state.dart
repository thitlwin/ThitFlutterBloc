import 'package:equatable/equatable.dart';

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
  final String hello;

  InGenreListState(this.hello) : super([hello]);

  @override
  String toString() => 'InGenreListState $hello';

}

class ErrorGenreListState extends GenreListState {
  final String errorMessage;

  ErrorGenreListState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorGenreListState';
}
