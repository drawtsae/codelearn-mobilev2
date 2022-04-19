import 'dart:async';

import 'package:boilerplate/data/network/apis/identity_api.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';

class IdentityRepository {
  // data source object

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final IdentityApi _identityApi;
  // constructor
  IdentityRepository(this._identityApi, this._sharedPrefsHelper);

  // Login:---------------------------------------------------------------------
  Future<bool> login(String username, String password) async {
    var data = await _identityApi.signIn(username, password);

    return await _sharedPrefsHelper.saveAuthToken(data.jwToken.toString());
  }

  // Register:---------------------------------------------------------------------
  Future<bool> register(
    String firstName,
    String lastName,
    String email,
    String userName,
    String password,
    String confirmPassword,
  ) async {
    var data = await _identityApi.register(
      firstName,
      lastName,
      email,
      userName,
      password,
      confirmPassword,
    );

    return true;
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;
}
