import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/data/network/wrappers/api_response.dart';
import 'package:boilerplate/models/course/course.dart';
import 'package:boilerplate/models/course/course_list.dart';

import 'package:simple_json_mapper/simple_json_mapper.dart';

class CourseApi {
  final DioClient _dioClient;

  CourseApi(this._dioClient);

  Future<Course?> getCourseById(String courseId) async {
    var param = {'courseId': courseId};
    final res = await _dioClient.get(
      Endpoints.getCourseById,
      queryParameters: param,
    );
    return JsonMapper.deserialize<Course>(res['data']);
  }

  Future<CourseList?> getCourses(
    String keyword,
    int pageNumber,
    int pageSize,
    String sortBy,
  ) async {
    var param = {
      'keyword': keyword,
      'PageNumber': pageNumber,
      'pageSize': pageSize,
      'sortBy': sortBy,
    };

    final res = await _dioClient.get(
      Endpoints.getCourses,
      queryParameters: param,
    );
    return JsonMapper.deserialize<CourseList>(res);
  }
}
