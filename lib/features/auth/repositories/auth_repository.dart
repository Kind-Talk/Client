import 'package:dio/dio.dart';
import 'package:front_end/core/network/api_client.dart';
import 'package:front_end/core/network/api_endpoints.dart';
import 'package:front_end/features/auth/models/login_response_model.dart';
import 'package:front_end/features/auth/models/user_model.dart';

class AuthRepository {
  final Dio _dio = ApiClient.instance;

  Future<LoginResponseModel> login(String email, String password) async {
    final response = await _dio.post(
      ApiEndpoints.login,
      data: 'username=$email&password=$password',
      options: Options(
        contentType: 'application/x-www-form-urlencoded',
      ),
    );
    return LoginResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<UserModel> join({
    required String email,
    required String password,
    required String userName,
    required String nickName,
    required String role,
    String? schoolCode,
  }) async {
    final response = await _dio.post(
      ApiEndpoints.join,
      data: {
        'email': email,
        'password': password,
        'userName': userName,
        'nickName': nickName,
        'role': role,
        if (schoolCode != null) 'schoolCode': schoolCode,
      },
    );
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<UserModel> getMe() async {
    final response = await _dio.get(ApiEndpoints.me);
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> logout() async {
    await _dio.post(ApiEndpoints.logout);
  }
}
