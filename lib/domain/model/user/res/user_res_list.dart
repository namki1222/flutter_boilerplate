import 'package:json_annotation/json_annotation.dart';

part 'user_res_list.g.dart';

@JsonSerializable()
class UserResList {
  final int id;
  final String loginId;
  final String tel;
  final String name;
  final String role;
  final bool active;
  final String? address;
  final String? addressDetail;
  final double? latitude;
  final double? longitude;
  final String? businessNumber;
  final String? company;
  final String? email;
  final String? typeOfBusiness;
  final String? itemsOfBusiness;
  final String? accountNumber;
  final String? thumbnail;
  final String grade;
  final String createdAt;
  final String? equipment;
  final int point;
  final int orderCount;
  final int successOrderCount;
  final bool isBlack;

  UserResList({
    required this.id,
    required this.loginId,
    required this.tel,
    required this.name,
    required this.role,
    required this.active,
    required this.address,
    required this.addressDetail,
    required this.latitude,
    required this.longitude,
    required this.businessNumber,
    required this.company,
    required this.email,
    required this.typeOfBusiness,
    required this.itemsOfBusiness,
    required this.accountNumber,
    required this.thumbnail,
    required this.grade,
    required this.createdAt,
    required this.equipment,
    required this.point,
    required this.orderCount,
    required this.successOrderCount,
    required this.isBlack,
  });

  UserResList copyWith({
    int? id,
    String? loginId,
    String? tel,
    String? name,
    String? role,
    bool? active,
    String? address,
    String? addressDetail,
    double? latitude,
    double? longitude,
    String? businessNumber,
    String? company,
    String? email,
    String? typeOfBusiness,
    String? itemsOfBusiness,
    String? accountNumber,
    String? thumbnail,
    String? grade,
    String? createdAt,
    String? equipment,
    int? point,
    int? orderCount,
    int? successOrderCount,
    bool? isBlack,
  }) =>
      UserResList(
        id: id ?? this.id,
        loginId: loginId ?? this.loginId,
        tel: tel ?? this.tel,
        name: name ?? this.name,
        role: role ?? this.role,
        active: active ?? this.active,
        address: address ?? this.address,
        addressDetail: addressDetail ?? this.addressDetail,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        businessNumber: businessNumber ?? this.businessNumber,
        company: company ?? this.company,
        email: email ?? this.email,
        typeOfBusiness: typeOfBusiness ?? this.typeOfBusiness,
        itemsOfBusiness: itemsOfBusiness ?? this.itemsOfBusiness,
        accountNumber: accountNumber ?? this.accountNumber,
        thumbnail: thumbnail ?? this.thumbnail,
        grade: grade ?? this.grade,
        createdAt: createdAt ?? this.createdAt,
        equipment: equipment ?? this.equipment,
        point: point ?? this.point,
        orderCount: orderCount ?? this.orderCount,
        successOrderCount: successOrderCount ?? this.successOrderCount,
        isBlack: isBlack ?? this.isBlack,
      );

  factory UserResList.fromJson(Map<String, dynamic> json) => _$UserResListFromJson(json);

  @override
  String toString() {
    return 'UserResList{id: $id, loginId: $loginId, tel: $tel, name: $name, role: $role, active: $active, address: $address, addressDetail: $addressDetail, latitude: $latitude, longitude: $longitude, businessNumber: $businessNumber, company: $company, email: $email, typeOfBusiness: $typeOfBusiness, itemsOfBusiness: $itemsOfBusiness, accountNumber: $accountNumber, thumbnail: $thumbnail, grade: $grade, createdAt: $createdAt, equipment: $equipment, point: $point, orderCount: $orderCount, successOrderCount: $successOrderCount, isBlack: $isBlack}';
  }
}
