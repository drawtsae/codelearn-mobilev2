import 'package:boilerplate/models/common_model/additional_field.dart';
import 'package:boilerplate/models/common_model/author.dart';
import 'package:boilerplate/models/common_model/category.dart';
import 'package:boilerplate/models/common_model/comment.dart';
import 'package:boilerplate/models/tag/tag.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

@JsonObject()
class Post {
  String? id;
  String? createdBy;
  String? createdAt;
  String? lastModifiedBy;
  String? lastModifiedAt;
  String? title;
  String? slug;
  String? summary;
  int? viewCount;
  int? sortPriority;
  String? content;
  String? authorId;
  bool? isNews;
  bool? isActive;
  String? imageUrl;
  List<AdditionalField>? additionalFields;
  bool? voteStatus;
  int? voteCount;
  Author? author;
  List<Category>? categories;
  List<Tag>? tags;
  List<Comment>? comments;
  int? commentCount;

  Post(
      {this.id,
      this.createdBy,
      this.createdAt,
      this.lastModifiedBy,
      this.lastModifiedAt,
      this.title,
      this.slug,
      this.summary,
      this.viewCount,
      this.sortPriority,
      this.content,
      this.authorId,
      this.isNews,
      this.isActive,
      this.imageUrl,
      this.additionalFields,
      this.voteStatus,
      this.voteCount,
      this.author,
      this.categories,
      this.tags,
      this.comments,
      this.commentCount});
}
