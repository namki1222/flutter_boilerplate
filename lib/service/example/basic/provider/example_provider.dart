import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repository/example/example_repository.dart';
import '../model/example_ui_model.dart';
import '../viewModel/example_view_model.dart';

final exampleViewModelProvider =
    StateNotifierProvider.autoDispose<ExampleViewModel, ExampleUiModel>((ref) {
  final repository = ref.watch(exampleRepositoryProvider);
  return ExampleViewModel(ref: ref, exampleRepository: repository);
});
