// example_view_model.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/example/example_repository.dart';
import '../model/example_ui_model.dart';

class ExampleViewModel extends StateNotifier<ExampleUiModel> {
  final Ref ref;
  final ExampleRepository exampleRepository;

  ExampleViewModel({required this.ref, required this.exampleRepository})
      : super(ExampleUiModel(displayName: '', age: 0));

  // 사용자 정보 가져오기 (비즈니스 로직 포함)

  Future<void> getAPi() async {
    try {
      final response = await exampleRepository.list();

      if (response.statusCode == 200) {
        debugPrint('회원가입 성공: ${response.message}');
      } else {
        throw Exception('예상치 못한 상태 코드: ${response.statusCode}');
      }
    } catch (err) {
      debugPrint('join error: $err');
      throw Exception('알 수 없는 오류 발생');
    } finally {}
  }
}
