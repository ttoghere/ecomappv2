import 'package:dartz/dartz.dart';
import 'package:ecomappv2/data/data_source/data_source_shelf.dart';
import 'package:ecomappv2/data/mapper/mapper_shelf.dart';
import 'package:ecomappv2/data/network/network_shelf.dart';
import 'package:ecomappv2/data/request/request_shelf.dart';
import 'package:ecomappv2/domain/domain_shelf.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;
  RepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Authentication>> login(
      {required LoginRequest loginRequest}) async {
    if (await networkInfo.isConnected) {
      //Api çağrısına uygun
      final response = await remoteDataSource.login(loginRequest: loginRequest);
      if (response.status == 0) {
        //Data getirme
        return Right(response.toDomain());
      } else {
        //Logic Hatası
        return Left(
          Failure(
              code: 409,
              message:
                  response.message ?? "Logic hatası yaşanıyor Api tarafından"),
        );
      }
    } else {
      //Bağlantı Hatası
      return Left(
        Failure(code: 501, message: "Check your internet connection"),
      );
    }
  }
}
