import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/models/user/user_info.dart';
import 'package:dio/dio.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

class UserApi {
  final DioClient _dioClient;

  UserApi(this._dioClient);

  //if userId it mean get current user
  Future<UserInfo?> getUserInformation(String? userId) async {
    final param = {'userId': userId};
    final res =
        await _dioClient.post(Endpoints.getProfileInformation, data: param);
    return JsonMapper.deserialize<UserInfo>(res['data']);
  }

  Future<bool> updateUserInfo(String firstName, String lastName, String gender,
      String phoneNumber) async {
    FormData formData = FormData.fromMap({
      'FirstName': firstName,
      'LastName': lastName,
      'Gender': gender,
      'PhoneNumber': phoneNumber,
      'Bio': ''
    });
    try {
      await _dioClient.put(Endpoints.updateUserInfo, data: formData);
      return true;
    } catch (e) {
      throw e;
    }
  }
}
