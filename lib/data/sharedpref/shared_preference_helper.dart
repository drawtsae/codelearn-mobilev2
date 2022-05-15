import 'dart:async';
import 'dart:convert';

import 'package:boilerplate/models/user/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPreference.getString(Preferences.auth_token);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(Preferences.auth_token, authToken);
  }

  Future<bool> saveWeviewToken(String authWebview, String persistRoot) async {
    await _sharedPreference.setString(Preferences.auth_webview, authWebview);
    return await _sharedPreference.setString(
        Preferences.persist_root, persistRoot);
  }

  Future<String?> get authWebview async {
    return _sharedPreference.getString(Preferences.auth_webview);
  }

  Future<UserInfo?> get currentUserInfo async {
    final String? authString = await persistRoot;
    if (authString != null) {
      var authObject = json.decode(authString);
      String currentUserString = authObject['user'];
      var currentUserObject = json.decode(currentUserString);
      var userInfo = JsonMapper.deserializeFromMap<UserInfo>(
          currentUserObject['currentUser']);
      return userInfo;
    }

    return null;
  }

  Future<String?> get persistRoot async {
    return _sharedPreference.getString(Preferences.persist_root);
  }

  Future<bool> removeAuthToken() async {
    await _sharedPreference.remove(Preferences.auth_webview);
    await _sharedPreference.remove(Preferences.persist_root);
    await saveIsLoggedIn(false);
    return _sharedPreference.remove(Preferences.auth_token);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.getBool(Preferences.is_logged_in) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference.setBool(Preferences.is_logged_in, value);
  }

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference.getBool(Preferences.is_dark_mode) ?? false;
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference.setBool(Preferences.is_dark_mode, value);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference.getString(Preferences.current_language);
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference.setString(Preferences.current_language, language);
  }
}
