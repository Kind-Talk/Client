import 'package:dio/dio.dart';
import 'package:front_end/core/network/api_client.dart';
import 'package:front_end/core/network/api_endpoints.dart';
import 'package:front_end/features/settings/models/child_model.dart';

class ChildService {
  final Dio _dio = ApiClient.instance;

  Future<List<ChildModel>> getAll() async {
    final response = await _dio.get(ApiEndpoints.children);
    return (response.data as List)
        .map((e) => ChildModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<ChildModel> create({
    required String name,
    required String schoolCode,
  }) async {
    final response = await _dio.post(
      ApiEndpoints.children,
      data: {'name': name, 'schoolCode': schoolCode},
    );
    return ChildModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<ChildModel> update({
    required int childId,
    required String name,
    required String schoolCode,
  }) async {
    final response = await _dio.patch(
      ApiEndpoints.child(childId),
      data: {'name': name, 'schoolCode': schoolCode},
    );
    return ChildModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> delete(int childId) async {
    await _dio.delete(ApiEndpoints.child(childId));
  }
}
