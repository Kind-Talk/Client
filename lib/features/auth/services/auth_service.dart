import 'package:dio/dio.dart';
import 'package:front_end/common/models/member.dart';
import 'package:front_end/core/network/api_client.dart';
import 'package:front_end/core/network/api_endpoints.dart';

class AuthService {
  final Dio _dio = ApiClient.instance;

  // ─── 로그인 ───────────────────────────────────────────────
  // POST /api/member/login (application/x-www-form-urlencoded)
  Future<void> login(String email, String password) async {
    await _dio.post(
      ApiEndpoints.login,
      data: 'username=$email&password=$password',
      options: Options(contentType: 'application/x-www-form-urlencoded'),
    );
  }

  // ─── 회원가입 ─────────────────────────────────────────────
  // POST /api/member/join (application/json)
  Future<void> signup({
    required String email,
    required String password,
    required String userName,
    required String nickName,
    String? schoolCode,
    required Role role,
  }) async {
    await _dio.post(
      ApiEndpoints.join,
      data: {
        'email': email,
        'password': password,
        'userName': userName,
        'nickName': nickName,
        'role': role == Role.teacher ? 'TEACHER' : 'PARENT',
        if (schoolCode != null) 'schoolCode': schoolCode,
      },
    );
  }

  // ─── 내 정보 조회 ─────────────────────────────────────────
  // GET /api/member/me
  Future<Member> getMe() async {
    final response = await _dio.get(ApiEndpoints.me);
    return Member.fromJson(response.data as Map<String, dynamic>);
  }

  // ─── 로그아웃 ─────────────────────────────────────────────
  // POST /api/member/logout
  Future<void> logout() async {
    await _dio.post(ApiEndpoints.logout);
  }
}
