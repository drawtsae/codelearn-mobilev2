import 'package:boilerplate/data/network/apis/comment_api.dart';

class CommentRepository {
  final CommentApi _api;

  CommentRepository(this._api);

  Future<String?> createComment(
    String? parentId,
    int commentLevel,
    String content,
    String type,
    String typeId,
  ) async {
    return await _api.createComment(
        parentId, commentLevel, content, type, typeId);
  }
}
