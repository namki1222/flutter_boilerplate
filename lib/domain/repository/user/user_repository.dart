import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/constant/data.dart';
import '../../../core/provider/dio_provider.dart';
import '../../model/base_res.dart';
import '../../model/user/res/user_res.dart';

part 'user_repository.g.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.watch(dioProvider);
  const baseUrl = '$baseHostV1/user';

  return UserRepository(dio, baseUrl: baseUrl);
});

@RestApi()
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @GET('/info')
  @Headers({'authorization': 'true'})
  Future<BaseResponse<UserRes>> info();

  // @GET('/logout')
  // @Headers({'authorization': 'true'})
  // Future<BaseResponse> logout();
  //
  // @PUT('/update')
  // @Headers({'authorization': 'true'})
  // Future<BaseResponse> update({
  //   @Body() required UserReqUpdate body,
  // });
  //
  // @DELETE('/withdrawal')
  // @Headers({'authorization': 'true'})
  // Future<BaseResponse> withdrawal();

//
// /// 프로필 사진 등록
// @POST('/file/register')
// @MultiPart()
// @Headers({'authorization': 'true'})
// Future<BaseResponse> fileRegister({
//   @Part(name: 'image') required File profileImage,
// });
//
//   @GET('/list')
//   @Headers({'authorization': 'true'})
//   Future<BaseResponse<List<UserRes>>> list({
//     @Query('page') int? page,
//     @Query('limit') int? limit = 15,
//     @Query('isBlack') String? isBlack,
//     @Query('tel') String? tel,
//   });
}
