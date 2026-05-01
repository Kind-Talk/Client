class LoginResponseModel {
  final String email;
  final String role;

  const LoginResponseModel({required this.email, required this.role});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      email: json['email'] as String,
      role: json['role'] as String,
    );
  }
}
