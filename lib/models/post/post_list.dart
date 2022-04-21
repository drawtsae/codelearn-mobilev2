import 'package:boilerplate/models/post/post.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

@JsonObject()
class PostList {
  List<Post>? data;
  num? page;
  num? totalCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  PostList(
      {this.data,
      this.page,
      this.totalCount,
      this.hasPreviousPage,
      this.hasNextPage});
}
