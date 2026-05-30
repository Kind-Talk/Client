class ChildModel {
  final int id;
  final int parentId;
  final String name;
  final String schoolCode;
  final String schoolName;

  const ChildModel({
    required this.id,
    required this.parentId,
    required this.name,
    required this.schoolCode,
    required this.schoolName,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      id: json['id'] as int,
      parentId: json['parentId'] as int,
      name: json['name'] as String,
      schoolCode: json['schoolCode'] as String,
      schoolName: json['schoolName'] as String,
    );
  }

  ChildModel copyWith({String? name, String? schoolCode, String? schoolName}) {
    return ChildModel(
      id: id,
      parentId: parentId,
      name: name ?? this.name,
      schoolCode: schoolCode ?? this.schoolCode,
      schoolName: schoolName ?? this.schoolName,
    );
  }
}
