// import 'package:retrofit/error_logger.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:boilerplate/domain/model/base_res.dart';

import '../../../core/provider/dio_provider.dart';
import '../../model/example/req/example_req.dart';
import '../../model/example/res/example_res.dart';

part 'example_repository.g.dart';


// TODO: 각 도메인 별 Repository 는 도메인 별 하나씩만 존재하는 것이 좋다. (스웨거의 형태를 그대로 따라감)
final exampleRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  const baseUrl = 'http://example.com/v1/example';

  return ExampleRepository(dio, baseUrl: baseUrl);
});

@RestApi()
abstract class ExampleRepository {
  factory ExampleRepository(Dio dio, {String baseUrl}) = _ExampleRepository;

  // TODO: Headers 의 경우, 추가적으로 Dio Interceptor 구현이 필요하다.
  @GET('/list')
  @Headers({'authorization': 'true'})
  Future<BaseResponse<List<ExampleRes>>> list(
  //     {
  //   @Body() required ExampleReq body,
  //   @Query('si') required String si,
  // }
  );

  @GET('/detail')
  @Headers({'authorization': 'true'})
  Future<BaseResponse<ExampleRes>> detail(
      //     {
      //   @Body() required ExampleReq body,
      //   @Query('si') required String si,
      // }
      );
}
