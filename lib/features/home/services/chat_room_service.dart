import 'package:front_end/common/models/chat_room.dart';

class ChatRoomService {
  // mock 데이터
  final List<ChatRoom> _mockRooms = [
    ChatRoom(
      id: 1,
      title: '2025년 1학년 2반',
      teacher: '김영희',
      announce: '다음 주 월요일 수업은 온라인으로 진행됩니다.',
      status: ChatRoomStatus.active,
    ),
    ChatRoom(
      id: 2,
      title: '2024년 1학년 1반',
      teacher: '김영희',
      announce: null,
      status: ChatRoomStatus.active,
    ),
    ChatRoom(
      id: 3,
      title: '2023년 2학년 3반',
      teacher: '김영희',
      announce: null,
      status: ChatRoomStatus.inactive,
    ),
  ];

  // ─── 채팅방 목록 조회 ──────────────────────────────────────
  // 실제 API: GET /api/chatroom (명세서 오면 추가 예정)
  Future<List<ChatRoom>> getChatRooms() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _mockRooms;
  }

  // ─── 채팅방 단건 조회 ─────────────────────────────────────
  // 실제 API: GET /api/chatroom/{id}
  Future<ChatRoom> getChatRoom(int id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockRooms.firstWhere((r) => r.id == id);
  }

  // ─── 채팅방 생성 ──────────────────────────────────────────
  // 실제 API: POST /api/chatroom
  Future<ChatRoom> createChatRoom(String title, String teacher) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final newRoom = ChatRoom(
      id: _mockRooms.length + 1,
      title: title,
      teacher: teacher,
      status: ChatRoomStatus.active,
    );
    _mockRooms.add(newRoom);
    return newRoom;
  }
}
