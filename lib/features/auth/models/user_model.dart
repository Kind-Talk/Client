class UserModel {
  final String email;
  final String userName;
  final String nickName;
  final String? schoolCode;
  final String? schoolName;
  final String role;

  const UserModel({
    required this.email,
    required this.userName,
    required this.nickName,
    this.schoolCode,
    this.schoolName,
    required this.role,
  });

  bool get isTeacher => role == 'TEACHER';

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      userName: json['userName'] as String,
      nickName: json['nickName'] as String,
      schoolCode: json['schoolCode'] as String?,
      schoolName: json['schoolName'] as String?,
      role: json['role'] as String,
    );
  }
}
