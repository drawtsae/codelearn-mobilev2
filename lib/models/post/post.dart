import 'package:boilerplate/models/common_model/additional_field.dart';
import 'package:boilerplate/models/common_model/author.dart';
import 'package:boilerplate/models/common_model/category.dart';
import 'package:boilerplate/models/common_model/comment.dart';
import 'package:boilerplate/models/lesson/lesson.dart';
import 'package:boilerplate/models/tag/tag.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

@JsonObject()
class Post {
  String? id;
  String? title;
  String? slug;
  num? sortPriority;
  String? summary;
  num? viewCount;
  num? voteCount;
  bool? isActive;
  bool? isComplete;
  String? imageUrl;
  String? content;
  bool? enrolled;
  num? enrolledCount;
  List<AdditionalField>? additionalFields;
  String? createdBy;
  String? createdAt;
  String? lastModifiedBy;
  String? lastModifiedAt;
  Author? author;
  List<Lesson>? lessons;
  List<Comment>? comments;
  List<Category>? categories;
  List<Tag>? tags;
  num? rateScore;
  num? rateCount;

  Post(
      {this.id,
      this.title,
      this.slug,
      this.sortPriority,
      this.summary,
      this.viewCount,
      this.voteCount,
      this.isActive,
      this.isComplete,
      this.imageUrl,
      this.content,
      this.enrolled,
      this.enrolledCount,
      this.additionalFields,
      this.createdBy,
      this.createdAt,
      this.lastModifiedBy,
      this.lastModifiedAt,
      this.author,
      this.lessons,
      this.comments,
      this.categories,
      this.tags,
      this.rateScore,
      this.rateCount});
}
