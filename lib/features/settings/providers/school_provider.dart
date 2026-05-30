import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_end/features/settings/models/school_model.dart';
import 'package:front_end/features/settings/services/school_service.dart';

final schoolServiceProvider = Provider<SchoolService>((_) => SchoolService());

// 검색 결과
final schoolSearchProvider =
    FutureProvider.autoDispose.family<List<SchoolModel>, String>(
  (ref, keyword) async {
    if (keyword.trim().isEmpty) return [];
    return ref.read(schoolServiceProvider).search(keyword);
  },
);
