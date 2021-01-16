import 'package:equatable/equatable.dart';

abstract class GenreCreateState extends Equatable {
  final List propss;
  GenreCreateState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnGenreCreateState extends GenreCreateState {
  UnGenreCreateState();

  @override
  String toString() => 'UnGenreCreateState';
}

/// Initialized
class InGenreCreateState extends GenreCreateState {
  final String hello;

  InGenreCreateState(this.hello) : super([hello]);

  @override
  String toString() => 'InGenreCreateState $hello';
}

class ErrorGenreCreateState extends GenreCreateState {
  final String errorMessage;

  ErrorGenreCreateState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorGenreCreateState';
}

class SuccessGenreCreateState extends GenreCreateState {
  SuccessGenreCreateState();

  @override
  String toString() => 'SuccessGenreCreateState';
}
