class ApiEndpoints {
  static const String baseUrl = 'http://localhost:8080';

  // Member
  static const String join = '/api/member/join';
  static const String login = '/api/member/login';
  static const String logout = '/api/member/logout';
  static const String me = '/api/member/me';
  static const String updateMe = '/api/member/me';
  static const String updateSchool = '/api/member/me/school';

  // Children
  static const String children = '/api/children';
  static String child(int id) => '/api/children/$id';

  // School
  static const String schoolSearch = '/api/schools';
}
