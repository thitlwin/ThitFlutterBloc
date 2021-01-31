import 'package:flutter/foundation.dart';
import 'package:thit_flutter_bloc/data/model/genre.dart';
import 'package:thit_flutter_bloc/provider/genre_provider.dart';

class GenreRepository {
  final GenreProvider _genreProvider = GenreProvider();

  Future saveGenre(Genre genre) async {
    return _genreProvider.saveGenre(genre);
  }

  Future updateGenre(Genre genre) async {
    return _genreProvider.updateGenre(genre);
  }

  Future deleteGenre(Genre genre) async {
    return _genreProvider.deleteGenre(genre);
  }

  Future loadGenre() async {
    return _genreProvider.loadGenre();
  }

  Stream<List<Genre>> getGenreListStream() {
    return _genreProvider.genres();
  }

  Future<List<Genre>> getGenreList() {
    return _genreProvider.genreList();
  }
}
