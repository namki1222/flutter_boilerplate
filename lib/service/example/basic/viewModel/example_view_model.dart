// example_view_model.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/repository/example/example_repository.dart';
import '../model/example_ui_model.dart';

part 'example_view_model.g.dart';

@riverpod
class ExampleViewModel extends _$ExampleViewModel {
  @override
  ExampleUiModel build() {
    // ✅ 초기 상태 설정
    return ExampleUiModel(displayName: 'Loading...', age: 0);
  }

  // ✅ API 호출 후 상태 변경
  Future<void> getApi() async {
    try {
      final response = await ref.read(exampleRepositoryProvider).list();

      if (response.statusCode == 200) {
        debugPrint('회원가입 성공: ${response.message}');

        // ✅ 여기서 state가 실제 화면에 반영되는 값
        state = ExampleUiModel(displayName: response.message, age: 25);
      } else {
        throw Exception('예상치 못한 상태 코드: ${response.statusCode}');
      }
    } catch (err) {
      debugPrint('join error: $err');
      throw Exception('알 수 없는 오류 발생');
    }
  }
}