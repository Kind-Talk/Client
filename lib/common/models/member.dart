enum Role { teacher, parent }

class Member {
  final String email;
  final String userName;
  final String nickName;
  final String? schoolCode;
  final String? schoolName;
  final Role role;

  Member({
    required this.email,
    required this.userName,
    required this.nickName,
    this.schoolCode,
    this.schoolName,
    required this.role,
  });

  bool get isTeacher => role == Role.teacher;

  // 백엔드 JSON -> Dart 객체 (나중에 실제 API 연동 때 사용)
  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      email: json['email'],
      userName: json['userName'],
      nickName: json['nickName'],
      schoolCode: json['schoolCode'],
      schoolName: json['schoolName'],
      role: json['role'] == 'TEACHER' ? Role.teacher : Role.parent,
    );
  }
}
