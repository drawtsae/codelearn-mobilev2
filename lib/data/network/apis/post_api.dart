import 'dart:async';

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

  /// Returns list of post in response
  //Future<PostList> getPosts() async {
  // try {
  //   final res = await _dioClient.get(Endpoints.getPosts);
  //   return PostList.fromJson(res);
  // } catch (e) {
  //   print(e.toString());
  //   throw e;
  // }
  //}
  Future<APIResponse<Post>?> getPostById(String id) async {
    try {
      final param = {'id': id};

      final res = await _dioClient.get(
        Endpoints.getPostById,
        queryParameters: param,
      );
      return JsonMapper.deserialize<APIResponse<Post>>(res);
    } catch (e) {
      return JsonMapper.deserialize<APIResponse<Post>>(e);
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

  /// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }

}
