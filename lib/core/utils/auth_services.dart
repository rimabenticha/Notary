import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteary/core/utils/service_locator.dart';

class AuthServices {
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return getIt.get<FirebaseAuth>().createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return getIt.get<FirebaseAuth>().signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signout() async {
    getIt.get<FirebaseAuth>().signOut();
  }

  Future<void> resetPassword({required String email}) async {
    getIt.get<FirebaseAuth>().sendPasswordResetEmail(email: email);
  }

  Future<UserCredential> reAuthenticateUser({
    required String email,
    required String oldPassword,
  }) async {
    final cred = EmailAuthProvider.credential(
      email: email,
      password: oldPassword,
    );
    return await getIt
        .get<FirebaseAuth>()
        .currentUser!
        .reauthenticateWithCredential(cred);
  }

  Future<void> updatePassword({required String newPassword}) async {
    await getIt.get<FirebaseAuth>().currentUser!.updatePassword(newPassword);
  }
}
