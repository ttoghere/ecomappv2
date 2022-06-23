import 'package:dio/dio.dart';
import 'package:ecomappv2/app/app_shelf.dart';
import 'package:ecomappv2/data/responses/responses_shelf.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login({
    @Field("email") String email,
    @Field("password") String password,
    @Field("deviceType") String deviceType,
    @Field("imei") String imei,
  });
}
