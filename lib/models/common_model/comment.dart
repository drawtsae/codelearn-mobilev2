import 'package:boilerplate/models/common_model/author.dart';

class Comment {
  String? id;
  String? parentId;
  num? commentLevel;
  bool? isActive;
  String? content;
  String? authorId;
  Author? author;
  String? createdAt;
  List<Comment>? comments;

  Comment(
      {this.id,
      this.parentId,
      this.commentLevel,
      this.isActive,
      this.content,
      this.authorId,
      this.author,
      this.createdAt,
      this.comments});
}
