import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteary/core/errors/failure.dart';
import 'package:noteary/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> signUp({
    required String fullName,
    required String email,
    required String password,
  });

  //* Store user info in cloud firestore
  Future<Either<Failure, Unit>> createUser(UserModel user);

  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signOut();

  Future<Either<Failure, Unit>> resetPassword({required String email});

  Stream<User?> authStateChanges();
}
