import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_delete/index.dart';

class GenreDeleteScreen extends StatefulWidget {
  const GenreDeleteScreen({
    Key key,
    @required GenreDeleteBloc genreDeleteBloc,
  })  : _genreDeleteBloc = genreDeleteBloc,
        super(key: key);

  final GenreDeleteBloc _genreDeleteBloc;

  @override
  GenreDeleteScreenState createState() {
    return GenreDeleteScreenState();
  }
}

class GenreDeleteScreenState extends State<GenreDeleteScreen> {
  GenreDeleteScreenState();

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
    return BlocBuilder<GenreDeleteBloc, GenreDeleteState>(
        cubit: widget._genreDeleteBloc,
        builder: (
          BuildContext context,
          GenreDeleteState currentState,
        ) {
          if (currentState is UnGenreDeleteState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorGenreDeleteState) {
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
           if (currentState is InGenreDeleteState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load() {
    widget._genreDeleteBloc.add(LoadGenreDeleteEvent());
  }
}
