import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteary/core/errors/failure.dart';
import 'package:noteary/core/utils/auth_services.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final FirebaseFirestore _cloudFirestore = getIt.get<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = getIt.get<FirebaseAuth>();
  final AuthServices authService;

  ProfileRepoImpl({required this.authService});

  @override
  Future<Either<Failure, User>> updatePersonalData({String? fullName}) async {
    try {
      if (fullName != null) {
        await getIt.get<FirebaseAuth>().currentUser!.updateDisplayName(
          fullName,
        );
      }
      await getIt.get<FirebaseAuth>().currentUser!.reload();
      final User refreshedUser = _firebaseAuth.currentUser!;
      await _cloudFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .update({'fullName': refreshedUser.displayName});
      return right(refreshedUser);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuth(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, User>> reAuthenticateUser({
    required String oldPassword,
  }) async {
    try {
      final UserCredential result = await authService.reAuthenticateUser(
        email: _firebaseAuth.currentUser!.email!,
        oldPassword: oldPassword,
      );
      return right(result.user!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuth(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePassword({
    required String newPassword,
  }) async {
    try {
      await authService.updatePassword(newPassword: newPassword);
      return right(unit);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuth(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }
}
