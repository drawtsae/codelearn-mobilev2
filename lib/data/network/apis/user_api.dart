import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/models/user/user_info.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

class UserApi {
  final DioClient _dioClient;

  UserApi(this._dioClient);

  Future<UserInfo?> getUserInfomation() async {
    final res = await _dioClient.post(Endpoints.getProfileInformation);
    return JsonMapper.deserialize<UserInfo>(res['data']);
  }
}
