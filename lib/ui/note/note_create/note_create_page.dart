import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/note/note_create/index.dart';

class NoteCreatePage extends StatefulWidget {
  static const String routeName = '/noteCreate';

  @override
  _NoteCreatePageState createState() => _NoteCreatePageState();
}

class _NoteCreatePageState extends State<NoteCreatePage> {
  final _noteCreateBloc = NoteCreateBloc(UnNoteCreateState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CreateNote'),
      ),
      body: NoteCreateScreen(noteCreateBloc: _noteCreateBloc),
    );
  }
}
