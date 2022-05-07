import '../constants/common.dart';
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
}
