import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_form_ui_model.freezed.dart';

@freezed
class ExampleFormUiModel with _$ExampleFormUiModel {
  const factory ExampleFormUiModel({
    required String name,
    required String email,
    required String phoneNumber,
  }) = _ExampleFormUiModel;
}
