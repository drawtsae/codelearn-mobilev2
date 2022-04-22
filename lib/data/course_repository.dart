import 'package:boilerplate/data/network/apis/course_api.dart';
import '../models/course/course_list.dart';

class CourseRepository {
  final CourseApi _courseApi;

  CourseRepository(this._courseApi);

  Future<void> getCourseById(String id) async {
    var data = await _courseApi.getCourseById(id);
  }

  Future<CourseList?> getCourses(
      String keyword, int pageNumber, int pageSize, String sortBy) async {
    var res =
        await _courseApi.getCourses(keyword, pageNumber, pageSize, sortBy);

    return res;
  }
}
