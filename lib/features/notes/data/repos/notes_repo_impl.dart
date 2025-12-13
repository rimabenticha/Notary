import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteary/core/errors/failure.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/notes/data/models/note_model.dart';
import 'package:noteary/features/notes/data/repos/notes_repo.dart';

class NotesRepoImpl implements NotesRepo {
  final FirebaseFirestore _cloudFirestore = getIt.get<FirebaseFirestore>();

  @override
  Future<Either<Failure, Unit>> saveNote({required NoteModel note}) async {
    try {
      await _cloudFirestore.collection('notes').doc(note.id).set(note.toJson());
      return right(unit);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuth(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, List<NoteModel>>> getNotes({
    required String uid,
  }) async {
    try {
      final notes = await _cloudFirestore
          .collection('notes')
          .where('uid', isEqualTo: uid)
          .orderBy('createdAt', descending: true)
          .get();
      return right(
        notes.docs.map((doc) => NoteModel.fromJson(doc.data())).toList(),
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseAuth(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }
}
