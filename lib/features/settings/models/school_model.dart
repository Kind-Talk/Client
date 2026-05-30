class SchoolModel {
  final String code;
  final String name;

  const SchoolModel({required this.code, required this.name});

  factory SchoolModel.fromJson(Map<String, dynamic> json) {
    return SchoolModel(
      code: json['code'] as String,
      name: json['name'] as String,
    );
  }
}
