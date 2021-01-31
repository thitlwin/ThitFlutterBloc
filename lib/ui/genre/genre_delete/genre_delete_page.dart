import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_delete/index.dart';

class GenreDeletePage extends StatefulWidget {
  static const String routeName = '/genreDelete';

  @override
  _GenreDeletePageState createState() => _GenreDeletePageState();
}

class _GenreDeletePageState extends State<GenreDeletePage> {
  final _genreDeleteBloc = GenreDeleteBloc(UnGenreDeleteState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GenreDelete'),
      ),
      body: GenreDeleteScreen(genreDeleteBloc: _genreDeleteBloc),
    );
  }
}
