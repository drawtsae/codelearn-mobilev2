import 'package:boilerplate/data/network/apis/course_api.dart';
import 'package:boilerplate/models/course/course.dart';

class CourseRepository {
  final CourseApi _courseApi;

  CourseRepository(this._courseApi);

  Future<void> getCourseById(String id) async {
    var data = await _courseApi.getCourseById(id);
  }

  Future<List<Course>> getCourses(
      String keyword, int pageNumber, int pageSize, String sortBy) async {
    var data =
        await _courseApi.getCourses(keyword, pageNumber, pageSize, sortBy);

    return data ?? [];
  }
}
