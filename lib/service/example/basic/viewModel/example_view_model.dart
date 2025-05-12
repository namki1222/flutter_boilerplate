// example_view_model.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/enum/response_state_enum.dart';
import '../../../../domain/repository/example/example_repository.dart';
import '../model/example_ui_model.dart';

part 'example_view_model.g.dart';

@riverpod
class ExampleViewModel extends _$ExampleViewModel {
  final _controller = StreamController<NetworkResStatus>.broadcast();
  Stream<NetworkResStatus> get exampleStream => _controller.stream;

  @override
  ExampleUiModel build() {
    return ExampleUiModel(displayName: 'Loading...', age: 0);
  }

  Future<void> getApi() async {
    _controller.add(NetworkResStatus.loading);
    try {
      final response = await ref.read(exampleRepositoryProvider).list();

      if (response.statusCode == 200) {
        /// 통신후 state 갱신
        _controller.add(NetworkResStatus.success);
        debugPrint('api 성공: ${response.message}');

        state = ExampleUiModel(displayName: response.message, age: 25);
      } else {
        _controller.add(NetworkResStatus.failure);
        throw Exception('예상치 못한 상태 코드: ${response.statusCode}');
      }
    } catch (err) {
      debugPrint('join error: $err');
      _controller.add(NetworkResStatus.failure);
      throw Exception('알 수 없는 오류 발생');
    }
  }
}