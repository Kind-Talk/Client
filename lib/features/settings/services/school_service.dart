import 'package:dio/dio.dart';
import 'package:front_end/core/network/api_client.dart';
import 'package:front_end/core/network/api_endpoints.dart';
import 'package:front_end/features/settings/models/school_model.dart';

class SchoolService {
  final Dio _dio = ApiClient.instance;

  Future<List<SchoolModel>> search(String keyword) async {
    final response = await _dio.get(
      ApiEndpoints.schoolSearch,
      queryParameters: {'search': keyword},
    );
    return (response.data as List)
        .map((e) => SchoolModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
