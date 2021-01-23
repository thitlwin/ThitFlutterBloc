import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_update/index.dart';

class GenreUpdatePage extends StatefulWidget {
  static const String routeName = '/genreUpdate';

  @override
  _GenreUpdatePageState createState() => _GenreUpdatePageState();
}

class _GenreUpdatePageState extends State<GenreUpdatePage> {
  final _genreUpdateBloc = GenreUpdateBloc(UnGenreUpdateState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GenreUpdate'),
      ),
      body: GenreUpdateScreen(genreUpdateBloc: _genreUpdateBloc),
    );
  }
}
