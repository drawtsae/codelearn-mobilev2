import 'package:boilerplate/data/network/apis/post_api.dart';
import 'package:boilerplate/models/post/post.dart';

class PostRepository {
  final PostApi _api;

  PostRepository(this._api);

  //
  Future<List<Post>> getPosts(
    String keyword,
    List<String> categoryIds,
    List<String> tagIds,
    String type,
    bool includeCategory,
    bool includeTag,
    int pageNumber,
    int pageSize,
  ) async {
    var res = await _api.getPosts(
      keyword,
      categoryIds,
      tagIds,
      type,
      includeCategory,
      includeTag,
      pageNumber,
      pageSize,
    );
    return res ?? [];
  }
}
