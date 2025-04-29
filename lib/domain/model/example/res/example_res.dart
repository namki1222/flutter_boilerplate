
import 'package:json_annotation/json_annotation.dart';

part 'example_res.g.dart';

// TODO: 각 모델의 이름은 [domain]_[req/res]_[API Suffix].dart 로 명명한다.
@JsonSerializable()
class ExampleRes {
  final int id;
  final String title;

  ExampleRes({
    required this.id,
    required this.title,
  });


  Map<String, dynamic> toJson() => _$ExampleResToJson(this);
  factory ExampleRes.fromJson(Map<String, dynamic> json) =>
      _$ExampleResFromJson(json);
}
