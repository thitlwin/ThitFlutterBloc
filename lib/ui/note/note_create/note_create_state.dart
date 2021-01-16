import 'package:equatable/equatable.dart';

abstract class NoteCreateState extends Equatable {

  final List propss;
  NoteCreateState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnNoteCreateState extends NoteCreateState {

  UnNoteCreateState();

  @override
  String toString() => 'UnNoteCreateState';
}

/// Initialized
class InNoteCreateState extends NoteCreateState {
  final String hello;

  InNoteCreateState(this.hello) : super([hello]);

  @override
  String toString() => 'InNoteCreateState $hello';

}

class ErrorNoteCreateState extends NoteCreateState {
  final String errorMessage;

  ErrorNoteCreateState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorNoteCreateState';
}

class SuccessNoteCreateState extends NoteCreateState {
  SuccessNoteCreateState();

  @override
  String toString() => 'SuccessNoteCreateState';
}

