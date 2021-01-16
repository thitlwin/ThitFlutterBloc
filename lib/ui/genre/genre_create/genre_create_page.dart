import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_create/index.dart';

class GenreCreatePage extends StatefulWidget {
  static const String routeName = '/genreCreate';

  @override
  _GenreCreatePageState createState() => _GenreCreatePageState();
}

class _GenreCreatePageState extends State<GenreCreatePage> {
  final _genreCreateBloc = GenreCreateBloc(UnGenreCreateState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GenreCreate'),
      ),
      body: GenreCreateScreen(genreCreateBloc: _genreCreateBloc),
    );
  }
}
