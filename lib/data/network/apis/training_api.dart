import 'package:boilerplate/constants/enums.dart';
import 'package:boilerplate/models/training/training.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';

import '../../../models/training/training_list.dart';
import '../constants/endpoints.dart';
import '../dio_client.dart';

class TrainingAPI {
  final DioClient _dioClient;
  TrainingAPI(this._dioClient);

  Future<TrainingList?> getTrainings(
    String keyword,
    String status,
    String level,
    String sortBy,
    int pageSize,
    int pageNumber,
  ) async {
    try {
      Map<String, dynamic> param = {
        'keyword': keyword,
        'status': status,
        'level': level,
        'sortBy': sortBy,
        'pageNumber': pageNumber,
        'pageSize': pageSize
      };

      final res = await _dioClient.get(
        Endpoints.getTrainings,
        queryParameters: param,
      );
      return JsonMapper.deserialize<TrainingList>(res);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Training>?> getUserTrainings(List<String> status,
      List<String> level, List<String> submitStatus) async {
    try {
      Map<String, dynamic> param = {
        'status': status,
        'level': level,
        'submitStatus': submitStatus
      };

      final res = await _dioClient.get(
        Endpoints.getUserTrainings,
        queryParameters: param,
      );
      return JsonMapper.deserialize<List<Training>>(res['data']);
    } catch (e) {
      throw e;
    }
  }
}
