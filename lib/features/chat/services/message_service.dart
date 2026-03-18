import 'package:front_end/common/models/message.dart';

class MessageService {
  // mock 메시지 데이터 (채팅방 id별)
  final Map<int, List<Message>> _mockMessages = {
    1: [
      Message(
        roomId: 1,
        senderId: 2, // 학부모
        content: '선생님~ 수업 진행 방식 알 수 있을까요?',
        sendAt: DateTime(2025, 3, 5, 9, 30),
      ),
      Message(
        roomId: 1,
        senderId: 1, // 선생님
        content: '안녕하세요, 다음 주 월요일 수업은 온라인으로 진행됩니다.',
        sendAt: DateTime(2025, 3, 5, 9, 35),
      ),
      Message(
        roomId: 1,
        senderId: 2,
        content: '선생님 ~ 이번주 숙제 알 수 있을까요?',
        sendAt: DateTime(2025, 3, 5, 10, 15),
      ),
    ],
    2: [
      Message(
        roomId: 2,
        senderId: 3,
        content: '안녕하세요 선생님!',
        sendAt: DateTime(2025, 3, 4, 14, 0),
      ),
    ],
  };

  // ─── 메시지 이력 조회 ─────────────────────────────────────
  // 실제 API: GET /api/chatroom/{roomId}/messages
  Future<List<Message>> getMessages(int roomId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockMessages[roomId] ?? [];
  }

  // ─── 메시지 전송 (로컬 mock) ──────────────────────────────
  // 실제: WebSocket STOMP /pub/chat.{roomId}
  Future<Message> sendMessage(int roomId, int senderId, String content) async {
    final msg = Message(
      roomId: roomId,
      senderId: senderId,
      content: content,
      sendAt: DateTime.now(),
    );
    _mockMessages.putIfAbsent(roomId, () => []).add(msg);
    return msg;
  }
}
