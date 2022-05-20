import 'dart:convert';
import 'package:boilerplate/data/network/apis/identity_api.dart';
import 'package:boilerplate/data/network/apis/user_api.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

class IdentityRepository {
  // data source object

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final IdentityApi _identityApi;
  final UserApi _userApi;
  // constructor
  IdentityRepository(this._identityApi, this._sharedPrefsHelper, this._userApi);

  // Login:---------------------------------------------------------------------
  Future<bool> login(String username, String password) async {
    var data = await _identityApi.signIn(username, password);
    await _sharedPrefsHelper.saveAuthToken(data!.jwToken!);

    final userInfo = await _userApi.getUserInformation();
    final sb = StringBuffer();
    sb.writeAll(data.roles ?? <String>['Basic'], ', ');

    var currentUser = {
      "currentUser": JsonMapper.serializeToMap(userInfo),
      "getProfile": "SUCCESS",
      "updateProfile": "NULL"
    };
    var authWebviewAuth = {
      "id": data.id,
      "jwToken": data.jwToken,
      "role": sb.toString()
    };

    String userString = json.encode(currentUser);
    var perisistRoot = {
      'user': userString,
      '_persist': "{\"version\":-1,\"rehydrated\":true}"
    };
    return await _sharedPrefsHelper.saveWeviewToken(
        json.encode(authWebviewAuth), json.encode(perisistRoot));
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

  Future<bool> changePassword(String currentPassword, String newPassword,
      String confirmNewPassword) async {
    await _identityApi.changePassword(
        currentPassword, newPassword, confirmNewPassword);
    return true;
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  Future<void> logout() async {
    this.saveIsLoggedIn(false);
    await _sharedPrefsHelper.removeAuthToken();
  }

  Future<bool> updateProfile(
    String firstName,
    String lastName,
    String gender,
    String phoneNumber,
  ) async {
    final res =
        await _userApi.updateUserInfo(firstName, lastName, gender, phoneNumber);
    return res;
  }
}
