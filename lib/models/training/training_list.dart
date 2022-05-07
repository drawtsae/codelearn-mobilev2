import 'package:boilerplate/models/training/training.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

@JsonObject()
class TrainingList {
  List<Training>? data;
  num? page;
  num? totalCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  TrainingList(
      {this.data,
      this.page,
      this.totalCount,
      this.hasPreviousPage,
      this.hasNextPage});
}
