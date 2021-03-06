import 'package:boilerplate/data/network/apis/course_api.dart';
import 'package:boilerplate/models/course/course.dart';
import '../models/course/course_list.dart';

class CourseRepository {
  final CourseApi _courseApi;

  CourseRepository(this._courseApi);

  Future<Course> getCourseById(String id) async {
    var data = await _courseApi.getCourseById(id);
    return data!;
  }

  Future<CourseList?> getCourses(
      String keyword, int pageNumber, int pageSize, String sortBy) async {
    var res =
        await _courseApi.getCourses(keyword, pageNumber, pageSize, sortBy);

    return res;
  }

  Future<List<Course>> getUserCourses(List<String> filters) async {
    var res = await _courseApi.getUserCourses(filters);

    return res ?? [];
  }

  Future<bool> enrollCourse(String id) async {
    await _courseApi.enrollCourse(id);

    return true;
  }
}
