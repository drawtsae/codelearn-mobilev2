import 'package:boilerplate/models/common_model/comment.dart';
import 'package:boilerplate/models/test_case/testcase.dart';

import '../common_model/author.dart';

class Training {
  String? id;
  String? createdBy;
  String? createdAt;
  String? lastModifiedBy;
  String? lastModifiedAt;
  String? title;
  String? slug;
  int? sortPriority;
  String? level;
  String? summary;
  bool? isActive;
  String? content;
  String? videoUrl;
  List<String>? tags;
  Author? author;
  List<TestCase>? testCases;
  List<Comment>? comments;
  bool? isCompleted;
  int? userJoinCount;
  int? userCompletedCount;

  Training(
      {this.id,
      this.createdBy,
      this.createdAt,
      this.lastModifiedBy,
      this.lastModifiedAt,
      this.title,
      this.slug,
      this.sortPriority,
      this.level,
      this.summary,
      this.isActive,
      this.content,
      this.videoUrl,
      this.tags,
      this.author,
      this.testCases,
      this.comments,
      this.isCompleted,
      this.userJoinCount,
      this.userCompletedCount});
}
