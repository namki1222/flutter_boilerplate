import 'package:json_annotation/json_annotation.dart';

part 'example_req.g.dart';

// TODO: 각 모델의 이름은 [domain]_[req/res]_[API Suffix].dart 로 명명한다.
@JsonSerializable()
class ExampleReq {
  final int id;
  final String etc;

  ExampleReq({
    required this.id,
    required this.etc,
  });

  //copyWith
  ExampleReq copyWith({
    int? id,
    String? title,
  }) {
    return ExampleReq(
      id: id ?? this.id,
      etc: title ?? this.etc,
    );
  }


  factory ExampleReq.fromJson(Map<String, dynamic> json)
  => _$ExampleReqFromJson(json);
}
