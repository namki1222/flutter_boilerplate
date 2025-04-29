import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_ui_model.freezed.dart';

@freezed
class ExampleUiModel with _$ExampleUiModel {
  const factory ExampleUiModel({
    required String displayName,
    required int age,
  }) = _ExampleUiModel;
}
