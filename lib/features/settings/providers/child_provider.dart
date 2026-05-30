import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_end/features/settings/models/child_model.dart';
import 'package:front_end/features/settings/services/child_service.dart';

final childServiceProvider = Provider<ChildService>((_) => ChildService());

final childrenProvider =
    AsyncNotifierProvider<ChildrenNotifier, List<ChildModel>>(
  ChildrenNotifier.new,
);

class ChildrenNotifier extends AsyncNotifier<List<ChildModel>> {
  ChildService get _service => ref.read(childServiceProvider);

  @override
  Future<List<ChildModel>> build() => _service.getAll();

  Future<void> add({required String name, required String schoolCode}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _service.create(name: name, schoolCode: schoolCode);
      return _service.getAll();
    });
  }

  Future<void> edit({
    required int childId,
    required String name,
    required String schoolCode,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _service.update(childId: childId, name: name, schoolCode: schoolCode);
      return _service.getAll();
    });
  }

  Future<void> remove(int childId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _service.delete(childId);
      return _service.getAll();
    });
  }
}
