import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

import '../../../models/category/category_list.dart';

class CategoryAPI {
  final DioClient _dioClient;

  CategoryAPI(this._dioClient);

  Future<CategoryList?> getCategories() async {
    var param = {'ShowHidden': false};
    final res = await _dioClient.get(
      Endpoints.getCategories,
      queryParameters: param,
    );
    return JsonMapper.deserialize<CategoryList>(res);
  }
}
