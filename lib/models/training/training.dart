import '../common_model/additional_field.dart';
import '../common_model/author.dart';

class Training {
  String? id;
  String? title;
  String? slug;
  num? sortPriority;
  String? level;
  String? summary;
  bool? isActive;
  String? content;
  String? videoUrl;
  List<AdditionalField>? additionalFields;
  String? authorId;
  Author? author;

  Training({
    this.id,
    this.title,
    this.slug,
    this.sortPriority,
    this.level,
    this.summary,
    this.isActive,
    this.content,
    this.videoUrl,
    this.additionalFields,
    this.authorId,
    this.author,
  });
}
