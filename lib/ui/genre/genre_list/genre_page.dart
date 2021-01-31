import 'package:flutter/material.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_create/index.dart';
import 'package:thit_flutter_bloc/ui/genre/genre_list/index.dart';

class GenreListPage extends StatefulWidget {
  static const String routeName = '/genreList';

  @override
  _GenreListPageState createState() => _GenreListPageState();
}

class _GenreListPageState extends State<GenreListPage> {
  final _genreListBloc = GenreListBloc(UnGenreListState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GenreList'),
        actions: [
          IconButton(
              tooltip: 'Add New',
              icon: const Icon(Icons.add),
              onPressed: () {
                print('add new genre');
                Navigator.pushNamed(context, GenreCreatePage.routeName);
              })
        ],
      ),
      body: GenreListScreen(genreListBloc: _genreListBloc),
    );
  }
}
