import 'package:equatable/equatable.dart';

abstract class GenreDeleteState extends Equatable {
  final List propss;
  GenreDeleteState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnGenreDeleteState extends GenreDeleteState {
  UnGenreDeleteState();

  @override
  String toString() => 'UnGenreDeleteState';
}

/// Initialized
class InGenreDeleteState extends GenreDeleteState {
  final String hello;

  InGenreDeleteState(this.hello) : super([hello]);

  @override
  String toString() => 'InGenreDeleteState $hello';
}

class ErrorGenreDeleteState extends GenreDeleteState {
  final String errorMessage;

  ErrorGenreDeleteState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorGenreDeleteState';
}

class SuccessGenreDeleteState extends GenreDeleteState {
  SuccessGenreDeleteState();

  @override
  String toString() => 'SuccessGenreDeleteState';
}
