import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/note/note_create/index.dart';
import 'package:thit_flutter_bloc/ui/note/note_list/index.dart';

class NoteListPage extends StatefulWidget {
  static const String routeName = '/noteList';

  @override
  _NoteListPageState createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  final _noteListBloc = NoteListBloc(UnNoteListState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
        actions: [
          IconButton(
            tooltip: 'Add New',
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () {
              print('add new note');
              Navigator.pushNamed(context, NoteCreatePage.routeName);
            },
          ),
        ],
      ),
      body: NoteListScreen(noteListBloc: _noteListBloc),
    );
  }
}
