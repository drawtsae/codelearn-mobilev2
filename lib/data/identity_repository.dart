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

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;
}
