import 'package:boilerplate/domain/repository/example/example_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/example_form_ui_model.dart';
import '../viewModel/example_form_view_model.dart';

final exampleFormProvider =
    StateNotifierProvider.autoDispose<ExampleFormViewModel, ExampleFormUiModel>(
        (ref) {
  final repository = ref.watch(exampleRepositoryProvider);
  return ExampleFormViewModel(ref: ref, exampleRepository: repository);
});
