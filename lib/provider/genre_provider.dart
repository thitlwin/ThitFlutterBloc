import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thit_flutter_bloc/data/model/genre.dart';

class GenreProvider {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final genreCollection = FirebaseFirestore.instance.collection('genre');

  @override
  Future<void> saveGenre(Genre genre) {
    return genreCollection.add(genre.toDocument());
  }

  @override
  Future deleteGenre(Genre genre) {
    return genreCollection.doc().delete();
  }

  @override
  Future updateGenre(Genre genre) {
    return genreCollection.doc().update(genre.toDocument());
  }

  @override
  Future loadGenre() {
    // return genreCollection.document().loadData.toDocument();
  }

  Stream<List<Genre>> genres() {
    return genreCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Genre.fromSnapshot(doc)).toList();
    });
  }

  Future<List<Genre>> genreList() {
    return genreCollection.get().then((value) {
      return value.docs.map((doc) => Genre.fromSnapshot(doc)).toList();
    });
  }
}
