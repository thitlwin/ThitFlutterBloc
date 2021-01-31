import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/data/model/genre.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_create/index.dart';

class GenreCreateScreen extends StatefulWidget {
  const GenreCreateScreen({
    Key key,
    @required GenreCreateBloc genreCreateBloc,
  })  : _genreCreateBloc = genreCreateBloc,
        super(key: key);

  final GenreCreateBloc _genreCreateBloc;

  @override
  GenreCreateScreenState createState() {
    return GenreCreateScreenState();
  }
}

class GenreCreateScreenState extends State<GenreCreateScreen> {
  GenreCreateScreenState();
  final genreNameController = TextEditingController();
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
    return BlocConsumer<GenreCreateBloc, GenreCreateState>(
        cubit: widget._genreCreateBloc,
        listener: (context, state) {
          if (state is SuccessGenreCreateState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Successfully created'),
              duration: const Duration(seconds: 3),
            ));
          }
        },
        builder: (
          BuildContext context,
          GenreCreateState currentState,
        ) {
          if (currentState is UnGenreCreateState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorGenreCreateState) {
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
          if (currentState is InGenreCreateState) {
            return _formContent();
          }
          if (currentState is SuccessGenreCreateState) {
            genreNameController.text = "";
            return _formContent();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load() {
    widget._genreCreateBloc.add(LoadGenreCreateEvent());
  }

  Widget _formContent() {
    const sizedBoxSpace = SizedBox(height: 24);
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
                controller: genreNameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  filled: true,
                  icon: const Icon(Icons.person),
                  hintText: 'Genre Name',
                  labelText: 'Genre Name',
                ),
                onSaved: (value) {},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter genre name';
                  }
                  return null;
                },
              ),
              sizedBoxSpace,
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    var genre = Genre(genreName: genreNameController.text);
                    widget._genreCreateBloc
                        .add(DoGenreCreateEvent(genre: genre));
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
