import 'package:shared_preferences/shared_preferences.dart';
import 'package:thit_flutter_bloc/data/db/database_provider.dart';
import 'package:thit_flutter_bloc/data/db/table_provider.dart';
import 'package:thit_flutter_bloc/data/model/note.dart';
import 'package:thit_flutter_bloc/utils/application_keys.dart';

import 'dart:developer' as developer;

class NoteProvider {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final dbProvider = DatabaseProvider.dbProvider;

  // final logger = Logger();
  // ApiProvider _apiProvider;
  // BankProvider() {
  //   _apiProvider = ApiProvider(ApiConstant.dio);
  // }

  Future<String> getAuthToken() async {
    print('----------getAuthToken@NoteProvider');
    final SharedPreferences prefs = await _prefs;
    var authToken = await prefs.getString(AppLicationKeys.authToken);
    print('----------getAuthToken@NoteProvider authToken=${authToken}');
    return authToken;
  }

  Future<void> saveAuthToken(String authToken) async {
    try {
      final SharedPreferences prefs = await _prefs;
      prefs
          .setString(AppLicationKeys.authToken, authToken)
          .then((value) => print('save token = ${value}'));
    } catch (e, stackTrace) {
      developer.log("Saved Error", error: e, stackTrace: stackTrace);
    }
  }

  Future<void> deleteToken() async {
    print('delete token@NoteProvider -----');
    try {
      final SharedPreferences prefs = await _prefs;
      prefs
          .remove(AppLicationKeys.authToken)
          .then((value) => print('delete auth token = ${value}'));
    } catch (e, stackTrace) {
      developer.log("Error",
          name: 'deleteBank', error: e, stackTrace: stackTrace);
    }
  }

  // Future<String> getAuthNoteFromPref() async {
  //   print('----------getAuthNoteEmail@NoteProvider');
  //   final SharedPreferences prefs = await _prefs;
  //   var authNote = await prefs.getString(AppLicationKeys.authNoteEmail);
  //   print('----------getAuthToken@NoteProvider authToken=${authNoteEmail}');
  //   return authNote;
  // }

  Future saveNoteToDB(Note note) async {
    try {
      final db = await dbProvider.database;
      var res = db.insert(TableProvider.noteTable, note.toJson());
      return res;
    } catch (e, stackTrace) {
      developer.log("Saved Error", error: e, stackTrace: stackTrace);
    }
  }

  Future getAllNote() async {
    try {
      final db = await dbProvider.database;
      var res = await db.query(TableProvider.noteTable);
      return res.map((it) => Note.fromJson(it)).toList();
    } catch (e, stackTrace) {
      developer.log("getAllNote Error", error: e, stackTrace: stackTrace);
    }
  }
}
