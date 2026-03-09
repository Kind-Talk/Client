enum ChatRoomStatus { active, inactive }

class ChatRoom {
  final int id;
  final String title;
  final String? announce;
  final String teacher;
  final ChatRoomStatus status;

  ChatRoom({
    required this.id,
    required this.title,
    this.announce,
    required this.teacher,
    required this.status,
  });

  // 백엔드 JSON -> Dart 객체 (나중에 실제 API 연동 때 사용)
  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      id: json['id'],
      title: json['title'],
      announce: json['announce'],
      teacher: json['teacher'],
      status: json['status'] == 'ACTIVE'
          ? ChatRoomStatus.active
          : ChatRoomStatus.inactive,
    );
  }
}
