import 'package:boilerplate/data/network/apis/comment_api.dart';
import 'package:boilerplate/models/category/category_list.dart';

import 'network/apis/category_api.dart';

class CategoryRepository {
  final CategoryAPI _api;

  CategoryRepository(this._api);

  Future<CategoryList?> getCategories() async {
    return await _api.getCategories();
  }
}
