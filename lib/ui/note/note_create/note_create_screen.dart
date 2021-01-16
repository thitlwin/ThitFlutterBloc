import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/data/model/note.dart';
import 'package:thit_flutter_bloc/ui/note/note_create/index.dart';

class NoteCreateScreen extends StatefulWidget {
  const NoteCreateScreen({
    Key key,
    @required NoteCreateBloc noteCreateBloc,
  })  : _noteCreateBloc = noteCreateBloc,
        super(key: key);

  final NoteCreateBloc _noteCreateBloc;

  @override
  NoteCreateScreenState createState() {
    return NoteCreateScreenState();
  }
}

class NoteCreateScreenState extends State<NoteCreateScreen> {
  NoteCreateScreenState();
  final noteController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return BlocConsumer<NoteCreateBloc, NoteCreateState>(
            cubit: widget._noteCreateBloc,
             listener: (context, state) {
              if (state is SuccessNoteCreateState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Successfully created'),
                  duration: const Duration(seconds: 1),
                ));
              }
            },
            builder: (
              BuildContext context,
              NoteCreateState currentState,
            ) {
              if (currentState is UnNoteCreateState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (currentState is ErrorNoteCreateState) {
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
              if (currentState is InNoteCreateState) {
                return _formContent();
              }
              if (currentState is SuccessNoteCreateState) {
                noteController.text = "";
                return _formContent();
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            });
  }

  void _load() {
    widget._noteCreateBloc.add(LoadNoteCreateEvent());
  }

  Widget _formContent() {
    const sizedBoxSpace = SizedBox(height: 25);
    return Form(
      key: _formKey,
      child: Scrollbar(
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.down,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              sizedBoxSpace,
              TextFormField(
                controller: noteController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  filled: true,
                  icon: const Icon(Icons.person),
                  hintText: 'AddNote',
                  labelText: 'AddNote',
                ),
                onSaved: (value) {},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'AddNote';
                  }
                  return null;
                },
              ),
              sizedBoxSpace,
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    var note = Note(
                        note: noteController.text, read_flag: 0);
                    widget._noteCreateBloc.add(DoNoteCreateEvent(note: note));
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
