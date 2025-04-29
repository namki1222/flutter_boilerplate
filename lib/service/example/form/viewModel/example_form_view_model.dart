// example_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/example/example_repository.dart';
import '../model/example_form_ui_model.dart';

class ExampleFormViewModel extends StateNotifier<ExampleFormUiModel> {
  final Ref ref;
  final ExampleRepository exampleRepository;

  ExampleFormViewModel({required this.ref, required this.exampleRepository})
      : super(ExampleFormUiModel(name: '', email: '', phoneNumber: ''));

  // 이름 업데이트
  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  // 이메일 업데이트
  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  // 전화번호 업데이트
  void updatePhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }
}
