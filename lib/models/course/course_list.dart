import 'package:boilerplate/models/course/course.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

@JsonObject()
class CourseList {
  List<Course>? data;
  num? page;
  num? totalCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  CourseList(
      {this.data,
      this.page,
      this.totalCount,
      this.hasPreviousPage,
      this.hasNextPage});
}
