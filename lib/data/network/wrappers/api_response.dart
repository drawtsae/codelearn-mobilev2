import 'package:simple_json_mapper/simple_json_mapper.dart';

class APIResponse<T> {
  late String status;
  late T data;

  APIResponse(String jsonData) {
    data = JsonMapper.deserialize(jsonData);
  }
}
