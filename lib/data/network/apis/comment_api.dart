import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';

class CommentApi {
  // dio instance
  final DioClient _dioClient;
  CommentApi(this._dioClient);

  Future<String> createComment(
    String? parentId,
    int commentLevel,
    String content,
    String type,
    String typeId,
  ) async {
    var bodyParam = {
      'parentId': parentId,
      'commentLevel': commentLevel,
      'content': content,
      'type': type,
      'typeId': typeId
    };
    var res = await _dioClient.post(Endpoints.createComment, data: bodyParam);
    return res['message'] ?? "";
  }
}
