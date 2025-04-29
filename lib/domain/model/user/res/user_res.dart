import 'package:json_annotation/json_annotation.dart';

part 'user_res.g.dart';

abstract class UserResBase {}

class UserResError extends UserResBase {
  final String message;

  UserResError({
    required this.message,
  });
}

class UserResLoading extends UserResBase {}

/// 기본 유저 모델, API 명세서에 따라 적절히 변형하여 사용한다.
@JsonSerializable()
class UserRes extends UserResBase {
  final int id;
  final String loginId;
  final String tel;
  final String name;
  final String role;
  final bool active;
  final String address;
  final String addressDetail;
  String? businessNumber;
  String? company;
  String? email;
  String? typeOfBusiness;
  String? itemsOfBusiness;
  String? accountNumber;
  String? thumbnail;
  final String grade;
  final String createdAt;
  String? equipment;
  final int point;
  final bool orderCarAlert;
  final bool distanceAlert;
  final bool alert;
  String? orderCar;
  String? distance;

  UserRes({
    required this.orderCarAlert,
    required this.distanceAlert,
    required this.alert,
    required this.id,
    required this.loginId,
    required this.tel,
    required this.name,
    required this.role,
    required this.active,
    required this.address,
    required this.addressDetail,
    this.businessNumber,
    this.company,
    this.email,
    this.typeOfBusiness,
    this.itemsOfBusiness,
    this.accountNumber,
    this.thumbnail,
    required this.grade,
    required this.createdAt,
    this.equipment,
    required this.point,
    this.orderCar,
    this.distance,
  });

  factory UserRes.fromJson(Map<String, dynamic> json) =>
      _$UserResFromJson(json);

  @override
  String toString() {
    return 'UserRes{id: $id, loginId: $loginId, tel: $tel, name: $name, role: $role, active: $active, address: $address, addressDetail: $addressDetail, businessNumber: $businessNumber, company: $company, email: $email, typeOfBusiness: $typeOfBusiness, itemsOfBusiness: $itemsOfBusiness, accountNumber: $accountNumber, thumbnail: $thumbnail, grade: $grade, createdAt: $createdAt, equipment: $equipment, point: $point, orderCarAlert: $orderCarAlert, distanceAlert: $distanceAlert, alert: $alert, orderCar: $orderCar, distance: $distance}';
  }
}
