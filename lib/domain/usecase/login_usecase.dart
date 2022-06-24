import 'package:dartz/dartz.dart';
import 'package:ecomappv2/app/functions.dart';

import 'package:ecomappv2/data/network/failure.dart';
import 'package:ecomappv2/data/request/login_request.dart';
import 'package:ecomappv2/domain/domain_shelf.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository repository;
  LoginUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();
    return await repository.login(
      loginRequest: LoginRequest(
        email: input.email,
        password: input.password,
        imei: deviceInfo.identifier,
        deviceType: deviceInfo.name,
      ),
    );
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput({
    required this.email,
    required this.password,
  });
}
