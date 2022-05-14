import 'package:simple_json_mapper/simple_json_mapper.dart';

@JsonObject()
class Category {
  String? id;
  String? parentId;
  num? categoryLevel;
  String? code;
  String? name;
  // List<Category>? subCategories;

  Category({
    this.id,
    this.parentId,
    this.categoryLevel,
    this.code,
    this.name,
  });
}
