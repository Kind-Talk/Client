import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_end/common/models/member.dart';
import 'package:front_end/features/auth/services/auth_service.dart';

final authServiceProvider = Provider<AuthService>((_) => AuthService());

// 현재 로그인한 유저 상태 (null = 미로그인)
final authProvider = AsyncNotifierProvider<AuthNotifier, Member?>(
  AuthNotifier.new,
);

class AuthNotifier extends AsyncNotifier<Member?> {
  AuthService get _service => ref.read(authServiceProvider);

  @override
  Future<Member?> build() async {
    try {
      return await _service.getMe();
    } catch (_) {
      return null;
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _service.login(email, password);
      return await _service.getMe();
    });
  }

  Future<void> signup({
    required String email,
    required String password,
    required String userName,
    required String nickName,
    required Role role,
    String? schoolCode,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _service.signup(
        email: email,
        password: password,
        userName: userName,
        nickName: nickName,
        role: role,
        schoolCode: schoolCode,
      );
      return null;
    });
  }

  Future<void> updateMe({
    required String userName,
    required String nickName,
  }) async {
    // 로컬 로딩 상태로 관리하므로 AsyncLoading 설정 생략
    final result = await AsyncValue.guard(() async {
      await _service.updateMe(userName: userName, nickName: nickName);
      return await _service.getMe();
    });
    state = result;
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _service.logout();
      return null;
    });
  }
}
