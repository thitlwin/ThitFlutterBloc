import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/ui/note/note_list/index.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({
    Key key,
    @required NoteListBloc noteListBloc,
  })  : _noteListBloc = noteListBloc,
        super(key: key);

  final NoteListBloc _noteListBloc;

  @override
  NoteListScreenState createState() {
    return NoteListScreenState();
  }
}

class NoteListScreenState extends State<NoteListScreen> {
  NoteListScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteListBloc, NoteListState>(
        cubit: widget._noteListBloc,
        builder: (
          BuildContext context,
          NoteListState currentState,
        ) {
          if (currentState is UnNoteListState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorNoteListState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
          if (currentState is InNoteListState) {
            if (currentState.noteList?.length > 0) {
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  for (int index = 0;
                      index < currentState.noteList.length;
                      index++)
                    ListTile(
                      leading: ExcludeSemantics(
                        child: CircleAvatar(child: Text('$index')),
                      ),
                      title: Text("#${currentState.noteList[index].note}"),
                      subtitle: Text('${currentState.noteList[index].note}'),
                    ),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("No list found."),
                  ],
                ),
              );
            }
          }
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
        });
  }

  void _load() {
    widget._noteListBloc.add(LoadNoteListEvent());
  }
}
