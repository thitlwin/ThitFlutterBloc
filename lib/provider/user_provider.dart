import 'dart:async';
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thit_flutter_bloc/data/db/database_provider.dart';
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

  Future<void> saveAuthUserToPref(String email, String password) async {
    try {
      // save email to pref
      final SharedPreferences prefs = await _prefs;
      prefs
          .setString(AppLicationKeys.authUserEmail, email)
          .then((value) => print('save saveAuthUserEmail = ${value}'));
    } catch (e, stackTrace) {
      developer.log("Saved Error", error: e, stackTrace: stackTrace);
    }
  }
}
