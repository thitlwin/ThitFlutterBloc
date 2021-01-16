import 'package:flutter/foundation.dart';
import 'package:thit_flutter_bloc/data/model/genre.dart';
import 'package:thit_flutter_bloc/provider/genre_provider.dart';

class GenreRepository {
  final GenreProvider _genreProvider = GenreProvider();

  Future saveGenre(Genre genre) async {
    return _genreProvider.saveGenreToDB(genre);
  }

  Future updateGenre(Genre genre) async {
    return _genreProvider.updateGenreToDB(genre);
  }

  Future deleteGenre(Genre genre) async {
    return _genreProvider.deleteGenreToDB(genre);
  }

  Future loadGenre() async {
    return _genreProvider.getAllGenre();
  }
}
