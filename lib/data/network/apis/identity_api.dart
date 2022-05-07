import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/models/course/course.dart';
import 'package:boilerplate/models/identity/token.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

class IdentityApi {
  final DioClient _dioClient;

  // injecting dio instance
  IdentityApi(this._dioClient);

  Future<Token?> signIn(String userName, String password) async {
    try {
      final res = await _dioClient.post(
        Endpoints.login,
        data: {
          "userName": userName,
          "password": password,
        },
      );
      return JsonMapper.deserialize<Token>(res['data']);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<Token?> register(
    String firstName,
    String lastName,
    String email,
    String userName,
    String password,
    String confirmPassword,
  ) async {
    try {
      final res = await _dioClient.post(
        Endpoints.register,
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "userName": userName,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );
      return JsonMapper.deserialize<Token>(res['data']);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future changePassword(String currentPassword, String newPassword,
      String confirmNewPassword) async {
    try {
      final res = await _dioClient.post(
        Endpoints.changePassword,
        data: {
          "currentPassword": currentPassword,
          "newPassword": newPassword,
          "confirmNewPassword": confirmNewPassword
        },
      );
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
