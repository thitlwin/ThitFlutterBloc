import 'package:flutter/foundation.dart';
import 'package:thit_flutter_bloc/provider/user_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<String> authenticate({
    @required String email,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    // TODO - to write code for getting auth token from server here
    await _userProvider.saveAuthUserToPref(email, password);
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await _userProvider.deleteToken();
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await _userProvider.saveAuthToken(token);
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    var token = await _userProvider.getAuthToken();
    return token != null ? true : false;
  }

  Future<void> persistAuthUser(String email, String password) async {
    /// write to keystore/keychain
    await _userProvider.saveAuthUserToPref(email, password);
    return;
  }
}
