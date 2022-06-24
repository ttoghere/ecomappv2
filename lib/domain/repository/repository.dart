import 'package:dartz/dartz.dart';
import 'package:ecomappv2/data/network/network_shelf.dart';
import 'package:ecomappv2/data/request/request_shelf.dart';
import 'package:ecomappv2/domain/domain_shelf.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(
      {required LoginRequest loginRequest});
}
