import 'package:dartz/dartz.dart';
import 'package:ecomappv2/data/network/network_shelf.dart';

abstract class BaseUseCase<In,Out> {
  Future<Either<Failure,Out>> execute(In input);
}