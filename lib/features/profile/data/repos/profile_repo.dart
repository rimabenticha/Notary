import 'package:dartz/dartz.dart';
import 'package:noteary/core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Unit>> updatePersonalData({String? fullName});
}
