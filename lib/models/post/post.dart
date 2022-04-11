import 'package:boilerplate/models/common_model/additional_info.dart';
import 'package:boilerplate/models/test_case/testcase.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

// Required annotation/decorator to opt-in model for json setup. Alias for [JsonObject]
@JsonObject()
class Post {
  String? id;
  String? createdBy;
  String? createdAt;
  String? lastModifiedBy;
  String? lastModifiedAt;
  String? courseId;
  String? parentId;
  String? title;
  String? slug;
  num? sortPriority;
  num? lessonLevel;
  String? summary;
  bool? isActive;
  String? content;
  String? videoUrl;
  List<AdditionalInfo>? additionalInfos;
  List<TestCase>? testCases;

  Post(
      {this.id,
      this.createdBy,
      this.createdAt,
      this.lastModifiedBy,
      this.lastModifiedAt,
      this.courseId,
      this.parentId,
      this.title,
      this.slug,
      this.sortPriority,
      this.lessonLevel,
      this.summary,
      this.isActive,
      this.content,
      this.videoUrl,
      this.additionalInfos,
      this.testCases});
}
