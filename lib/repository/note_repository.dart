import 'package:flutter/cupertino.dart';
import 'package:thit_flutter_bloc/data/model/note.dart';
import 'package:thit_flutter_bloc/provider/note_provider.dart';

class NoteRepository {
  final NoteProvider _noteProvider = NoteProvider();

  Future<String> authenticate({
    @required String note,
    @required String read_flag,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    // TODO - to write code for getting auth token from server here
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await _noteProvider.deleteToken();
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await _noteProvider.saveAuthToken(token);
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    var token = await _noteProvider.getAuthToken();
    return token != null ? true : false;
  }

  Future saveNote(Note note) async {
    return _noteProvider.saveNoteToDB(note);
  }

  Future loadNote() async {
    return _noteProvider.getAllNote();
  }
}
