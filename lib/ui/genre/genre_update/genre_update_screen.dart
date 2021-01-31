import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_update/index.dart';

class GenreUpdateScreen extends StatefulWidget {
  const GenreUpdateScreen({
    Key key,
    @required GenreUpdateBloc genreUpdateBloc,
  })  : _genreUpdateBloc = genreUpdateBloc,
        super(key: key);

  final GenreUpdateBloc _genreUpdateBloc;

  @override
  GenreUpdateScreenState createState() {
    return GenreUpdateScreenState();
  }
}

class GenreUpdateScreenState extends State<GenreUpdateScreen> {
  GenreUpdateScreenState();

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
    return BlocBuilder<GenreUpdateBloc, GenreUpdateState>(
        cubit: widget._genreUpdateBloc,
        builder: (
          BuildContext context,
          GenreUpdateState currentState,
        ) {
          if (currentState is UnGenreUpdateState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorGenreUpdateState) {
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
           if (currentState is InGenreUpdateState) {
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
    widget._genreUpdateBloc.add(LoadGenreUpdateEvent());
  }
}
