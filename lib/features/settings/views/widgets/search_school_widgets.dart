import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/features/settings/models/school_model.dart';
import 'package:front_end/features/settings/providers/school_provider.dart';

// ======== FUNCTIONS ========
// 학교 찾기 탭 호출 - 선택된 SchoolModel 반환
Future<SchoolModel?> showSchoolSearchTab(BuildContext context) {
  return showDialog<SchoolModel>(
    context: context,
    barrierDismissible: true,
    barrierColor: const Color(0x33111111),
    builder: (_) => const Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      child: SearchSchoolTab(),
    ),
  );
}

// ======== STATEFUL WIDGETS ========
// 학교 찾기 탭
class SearchSchoolTab extends ConsumerStatefulWidget {
  const SearchSchoolTab({super.key});

  @override
  ConsumerState<SearchSchoolTab> createState() => _SearchSchoolTabState();
}

class _SearchSchoolTabState extends ConsumerState<SearchSchoolTab> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchResult = ref.watch(schoolSearchProvider(_query));

    return Container(
      width: 334.w,
      constraints: BoxConstraints(maxHeight: 400.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              '학교 이름을 검색하세요',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF222222),
              ),
            ),
          ),

          SizedBox(height: 12.h),

          SizedBox(
            width: 302.w,
            height: 50.h,
            child: TextField(
              controller: _controller,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'ex) 유현초',
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xFF848484),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.w),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFF3F3F5),
              ),
            ),
          ),

          SizedBox(height: 8.h),

          // 검색 결과 목록
          searchResult.when(
            data: (schools) {
              if (schools.isEmpty && _query.isNotEmpty) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Center(
                    child: Text(
                      '검색 결과가 없습니다.',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ),
                );
              }
              return Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: schools.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final school = schools[i];
                    return ListTile(
                      title: Text(school.name,
                          style: TextStyle(fontSize: 14.sp)),
                      onTap: () => Navigator.pop(context, school),
                    );
                  },
                ),
              );
            },
            loading: () => Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const Center(child: CircularProgressIndicator()),
            ),
            error: (_, _) => Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Center(
                child: Text('오류가 발생했습니다.',
                    style: TextStyle(fontSize: 14.sp, color: Colors.red)),
              ),
            ),
          ),

          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
