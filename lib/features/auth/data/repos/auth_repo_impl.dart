import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteary/core/errors/failure.dart';
import 'package:noteary/core/utils/auth_services.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/auth/data/models/user_model.dart';
import 'package:noteary/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthServices authService;
  final FirebaseFirestore _cloudFirestore = getIt.get<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = getIt.get<FirebaseAuth>();

  AuthRepoImpl({required this.authService});

  @override
  Stream<User?> authStateChanges() {
    return getIt.get<FirebaseAuth>().authStateChanges();
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final userCredential = await authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(username);
      await userCredential.user?.reload();
      final updatedUser = getIt.get<FirebaseAuth>().currentUser;

      return right(updatedUser!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuth(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, Unit>> createUser(UserModel user) async {
    try {
      await _cloudFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .set(user.toJson());
      return right(unit);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuth(e));
      } else if (e is FirebaseException) {
        return left(FirebaseFailure.fromFirebase(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) async {
    try {
      await authService.resetPassword(email: email);
      return right(unit);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuth(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, User>> signin({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(userCredential.user!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuth(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signout() async {
    try {
      await authService.signout();
      return right(unit);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuth(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }
}
