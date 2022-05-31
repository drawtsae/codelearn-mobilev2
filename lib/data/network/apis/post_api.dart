import 'dart:async';

import 'package:boilerplate/constants/common.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/data/network/wrappers/api_response.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/models/post/post_list.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

class PostApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  PostApi(this._dioClient, this._restClient);

  Future<Post?> getPostById(String id) async {
    try {
      final param = {'id': id};

      final res = await _dioClient.get(
        Endpoints.getPostById,
        queryParameters: param,
      );
      return JsonMapper.deserialize<Post>(res['data']);
    } catch (e) {
      throw e;
    }
  }

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
    try {
      final param = {
        'keyword': keyword,
        'categoryIds': categoryIds,
        'type': type,
        'tagIds': tagIds,
        'includeCategory': includeCategory,
        'includeTag': includeTag,
        'pageNumber': pageNumber,
        'pageSize': pageSize
      };

      final res = await _dioClient.get(
        Endpoints.getPosts,
        queryParameters: param,
      );
      return JsonMapper.deserialize<PostList>(res);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> votePost(String postId, int status) async {
    final param = {'id': postId, 'status': status};
    try {
      await _dioClient.post(Endpoints.votePosts, data: param);
      return true;
    } catch (e) {
      throw e;
    }
  }

  Future<bool> createPost(String title, String slug, String summary,
      String content, List<String> categoryIds) async {
    final param = {
      'title': title,
      'slug': slug,
      'summary': summary,
      'content': content,
      'categoryIds': categoryIds,
      //486c2f76-0578-4239-9df4-ba503d69a706
      // By default :) from this
      'tagIds': [],
      'isNews': false,
      'imageUrl': EMPTY_STRING,
      'authorId': 'a7cf7bfe-6946-48df-aeba-78c53086de96',
    };
    try {
      final test = await _dioClient.post(Endpoints.createPost, data: param);
      return true;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Post>?> getUserPost(List<String> postFilter) async {
    final param = {'PostFilters': postFilter};
    final res = await _dioClient.get(
      Endpoints.getUserPost,
      queryParameters: param,
    );
    return JsonMapper.deserialize<List<Post>>(res['data']);
  }
}
