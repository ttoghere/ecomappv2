import 'package:ecomappv2/data/network/network_shelf.dart';
import 'package:ecomappv2/data/request/request_shelf.dart';
import 'package:ecomappv2/data/responses/responses_shelf.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login({required LoginRequest loginRequest});
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient appServiceClient;
  @override
  RemoteDataSourceImplementer({required this.appServiceClient});

  @override
  Future<AuthenticationResponse> login(
      {required LoginRequest loginRequest}) async {
    return await appServiceClient.login(
      loginRequest.email,
      loginRequest.imei,
      loginRequest.password,
      loginRequest.deviceType,
    );
  }
}
