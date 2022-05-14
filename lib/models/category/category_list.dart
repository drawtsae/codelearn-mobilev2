import 'package:boilerplate/models/category/category.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

@JsonObject()
class CategoryList {
  List<Category>? data;
  CategoryList({
    this.data,
  });
}
