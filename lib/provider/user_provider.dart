import 'dart:async';
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thit_flutter_bloc/data/db/database_provider.dart';
import 'package:thit_flutter_bloc/data/db/table_provider.dart';
import 'package:thit_flutter_bloc/data/model/user.dart';
import 'package:thit_flutter_bloc/utils/application_keys.dart';

class UserProvider {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final dbProvider = DatabaseProvider.dbProvider;

  // final logger = Logger();
  // ApiProvider _apiProvider;
  // BankProvider() {
  //   _apiProvider = ApiProvider(ApiConstant.dio);
  // }

  Future<String> getAuthToken() async {
    print('----------getAuthToken@UserProvider');
    final SharedPreferences prefs = await _prefs;
    var authToken = await prefs.getString(AppLicationKeys.authToken);
    print('----------getAuthToken@UserProvider authToken=${authToken}');
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
    print('delete token@UserProvider -----');
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

  Future<String> getAuthUserEmailFromPref() async {
    print('----------getAuthUserEmail@UserProvider');
    final SharedPreferences prefs = await _prefs;
    var authUserEmail = await prefs.getString(AppLicationKeys.authUserEmail);
    print('----------getAuthToken@UserProvider authToken=${authUserEmail}');
    return authUserEmail;
  }

  Future saveUserToDB(User user) async {
    try {
      final db = await dbProvider.database;
      var res = db.insert(TableProvider.userTable, user.toJson());
      return res;
    } catch (e, stackTrace) {
      developer.log("Saved Error", error: e, stackTrace: stackTrace);
    }
  }

  Future getAllUser() async {
    try {
      final db = await dbProvider.database;
      var res = await db.query(TableProvider.userTable);
      return res.map((it) => User.fromJson(it)).toList();
    } catch (e, stackTrace) {
      developer.log("getAllUser Error", error: e, stackTrace: stackTrace);
    }
  }
}
