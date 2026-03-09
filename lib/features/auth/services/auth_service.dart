import 'package:front_end/common/models/member.dart';

// 로그인한 유저 정보를 앱 전체에서 쓸 수 있도록 저장
Member? currentUser;

class AuthService {
  // ─── 로그인 ───────────────────────────────────────────────
  // 실제 API: POST /api/member/login
  // 지금은 mock 데이터 반환
  Future<Member> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500)); // 네트워크 지연 흉내

    // mock: 이메일에 "teacher"가 들어있으면 선생님으로 처리
    final isTeacher = email.contains('teacher');

    currentUser = Member(
      email: email,
      userName: isTeacher ? '김영희' : '홍길동',
      nickName: isTeacher ? '영희쌤' : '홍아빠',
      schoolCode: isTeacher ? 'SCH001' : null,
      schoolName: isTeacher ? '서울초등학교' : null,
      role: isTeacher ? Role.teacher : Role.parent,
    );

    return currentUser!;
  }

  // ─── 회원가입 ─────────────────────────────────────────────
  // 실제 API: POST /api/member/join
  Future<Member> signup({
    required String email,
    required String password,
    required String userName,
    required String nickName,
    String? schoolCode,
    required Role role,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return Member(
      email: email,
      userName: userName,
      nickName: nickName,
      schoolCode: schoolCode,
      role: role,
    );
  }

  // ─── 내 정보 조회 ─────────────────────────────────────────
  // 실제 API: GET /api/member/me
  Future<Member> getMe() async {
    await Future.delayed(const Duration(milliseconds: 300));

    // 로그인된 유저 반환, 없으면 에러
    if (currentUser == null) throw Exception('로그인이 필요합니다');
    return currentUser!;
  }

  // ─── 로그아웃 ─────────────────────────────────────────────
  // 실제 API: POST /api/member/logout
  Future<void> logout() async {
    currentUser = null;
  }
}
