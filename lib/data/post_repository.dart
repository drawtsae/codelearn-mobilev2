import 'package:boilerplate/data/network/apis/post_api.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/models/post/post_list.dart';

class PostRepository {
  final PostApi _api;

  PostRepository(this._api);

  //
  Future<PostList?> getPosts(
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
    return res;
  }

  Future<Post?> getPostById(String id) async {
    var res = await _api.getPostById(id);
    return res;
  }

  Future<bool> votePosts(String postId, int status) async {
    var res = await _api.votePost(postId, status);
    return res;
  }

  Future<bool> createPost(
    String title,
    String slug,
    String summary,
    String content,
    List<String> categoryIds,
  ) async {
    var res = await _api.createPost(title, slug, summary, content, categoryIds);
    return res;
  }
}
