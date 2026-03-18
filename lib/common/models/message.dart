class Message {
  final int roomId;
  final int senderId;
  final String content;
  final DateTime sendAt;

  Message({
    required this.roomId,
    required this.senderId,
    required this.content,
    required this.sendAt,
  });

  // 백엔드 JSON -> Dart 객체 (나중에 실제 API 연동 때 사용)
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      roomId: json['roomId'],
      senderId: json['senderId'],
      content: json['content'],
      sendAt: DateTime.parse(json['sendAt']),
    );
  }
}
