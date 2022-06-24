import 'package:dartz/dartz.dart';
import 'package:ecomappv2/data/data_source/data_source_shelf.dart';
import 'package:ecomappv2/data/mapper/mapper_shelf.dart';
import 'package:ecomappv2/data/network/error_handler.dart';
import 'package:ecomappv2/data/network/network_shelf.dart';
import 'package:ecomappv2/data/request/request_shelf.dart';
import 'package:ecomappv2/domain/domain_shelf.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource remoteDataSource;
  // NetworkInfo networkInfo;
  RepositoryImpl({
    required this.remoteDataSource,
    // required this.networkInfo,
  });

  @override
  Future<Either<Failure, Authentication>> login(
      {required LoginRequest loginRequest}) async {
   
      try {
        //Api çağrısına uygun
        final response =
            await remoteDataSource.login(loginRequest: loginRequest);
        if (response.status == ApiInternalStatus.success) {
          //Data getirme
          return Right(response.toDomain());
        } else {
          //Logic Hatası
          return Left(
            Failure(
                code: response.status ?? ApiInternalStatus.failure,
                message: response.message ?? ResponseMessage.Default),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    // } else {
    //   //Bağlantı Hatası
    //   return Left(DataSource.niInternetConnection.getFailure());
    // }
  }
}
