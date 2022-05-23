import 'package:boilerplate/data/network/apis/user_api.dart';
import 'package:boilerplate/models/user/user_info.dart';

class UserRepository {
  final UserApi _userApi;

  UserRepository(this._userApi);

  Future<UserInfo?> getUserInformation(String? userId) async {
    return await _userApi.getUserInformation(userId);
  }
}
