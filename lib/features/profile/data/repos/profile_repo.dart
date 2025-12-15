import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteary/core/errors/failure.dart';
import 'package:noteary/features/profile/data/models/contact_us_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, User>> updatePersonalData({String? fullName});

  Future<Either<Failure, User>> reAuthenticateUser({
    required String oldPassword,
  });

  Future<Either<Failure, Unit>> updatePassword({required String newPassword});

  Future<Either<Failure, Unit>> contactUs({required ContactUsModel contactUs});
}
