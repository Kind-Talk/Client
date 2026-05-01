import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:front_end/core/network/api_endpoints.dart';

class ApiClient {
  ApiClient._();

  static final CookieJar cookieJar = CookieJar();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.add(CookieManager(cookieJar));

  static Dio get instance => _dio;
}
