import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_list/index.dart';

class GenreListScreen extends StatefulWidget {
  const GenreListScreen({
    Key key,
    @required GenreListBloc genreListBloc,
  })  : _genreListBloc = genreListBloc,
        super(key: key);

  final GenreListBloc _genreListBloc;

  @override
  GenreListScreenState createState() {
    return GenreListScreenState();
  }
}

class GenreListScreenState extends State<GenreListScreen> {
  GenreListScreenState();

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
    return BlocBuilder<GenreListBloc, GenreListState>(
        cubit: widget._genreListBloc,
        builder: (
          BuildContext context,
          GenreListState currentState,
        ) {
          if (currentState is UnGenreListState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorGenreListState) {
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
           if (currentState is InGenreListState) {
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
    widget._genreListBloc.add(LoadGenreListEvent());
  }
}