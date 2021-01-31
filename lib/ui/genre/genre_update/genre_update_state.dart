import 'package:equatable/equatable.dart';

abstract class GenreUpdateState extends Equatable {

  final List propss;
  GenreUpdateState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnGenreUpdateState extends GenreUpdateState {

  UnGenreUpdateState();

  @override
  String toString() => 'UnGenreUpdateState';
}

/// Initialized
class InGenreUpdateState extends GenreUpdateState {
  final String hello;

  InGenreUpdateState(this.hello) : super([hello]);

  @override
  String toString() => 'InGenreUpdateState $hello';

}

class ErrorGenreUpdateState extends GenreUpdateState {
  final String errorMessage;

  ErrorGenreUpdateState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorGenreUpdateState';
}
