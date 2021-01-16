import 'package:equatable/equatable.dart';
import 'package:thit_flutter_bloc/data/model/note.dart';

abstract class NoteListState extends Equatable {

  final List propss;
  NoteListState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnNoteListState extends NoteListState {

  UnNoteListState();

  @override
  String toString() => 'UnNoteListState';
}

/// Initialized
class InNoteListState extends NoteListState {
  final List<Note> noteList;

  InNoteListState({this.noteList}) : super([noteList]);

  @override
  String toString() => 'ErrorNoteListState';

}

class ErrorNoteListState extends NoteListState {
  final String errorMessage;

  ErrorNoteListState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorNoteListState';
}
