import 'package:json_annotation/json_annotation.dart';

part 'user_req_update.g.dart';

@JsonSerializable(includeIfNull: false)
class UserReqUpdate {
  String? name;
  String? password;
  String? tel;
  String? address;
  String? addressDetail;
  String? businessNumber;
  String? company;
  String? email;
  String? typeOfBusiness;
  String? itemsOfBusiness;
  String? accountNumber;
  String? thumbnail;
  String? grade;
  String? equipment;
  double? latitude;
  double? longitude;
  String? loginId;
  bool? orderCarAlert;
  bool? distanceAlert;
  bool? alert;
  String? orderCar;
  String? distance;

  UserReqUpdate({
    this.latitude,
    this.longitude,
    this.name,
    this.password,
    this.tel,
    this.address,
    this.addressDetail,
    this.businessNumber,
    this.company,
    this.email,
    this.typeOfBusiness,
    this.itemsOfBusiness,
    this.accountNumber,
    this.thumbnail,
    this.grade,
    this.equipment,
    this.loginId,
    this.orderCarAlert,
    this.distanceAlert,
    this.alert,
    this.orderCar,
    this.distance,
  });

  factory UserReqUpdate.fromJson(Map<String, dynamic> json) =>
      _$UserReqUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$UserReqUpdateToJson(this);
}
