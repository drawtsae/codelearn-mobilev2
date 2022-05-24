import '../models/training/training_list.dart';
import 'network/apis/training_api.dart';

class TrainingRepository {
  final TrainingAPI _api;

  TrainingRepository(this._api);

  Future<TrainingList?> getTrainings(
    String keyword,
    String status,
    String level,
    String sortBy,
    int pageSize,
    int pageNumber,
  ) async {
    return await _api.getTrainings(
      keyword,
      status,
      level,
      sortBy,
      pageSize,
      pageNumber,
    );
  }

  Future<bool?> createTraining(
      String title,
      String slug,
      String summary,
      String level,
      String content,
      String videoUrl,
      String tags,
      // This is for test cases areas
      String in1,
      String out1,
      String in2,
      String out2,
      String in3,
      String out3) async {
    return await _api.createTraining(
        title,
        slug,
        summary,
        level,
        content,
        videoUrl,
        tags,
        // This is for test cases areas
        in1,
        out1,
        in2,
        out2,
        in3,
        out3);
  }
}
