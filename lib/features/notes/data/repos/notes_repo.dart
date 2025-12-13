import 'package:dartz/dartz.dart';
import 'package:noteary/core/errors/failure.dart';
import 'package:noteary/features/notes/data/models/note_model.dart';

abstract class NotesRepo {
  Future<Either<Failure, Unit>> saveNote({required NoteModel note});

  Future<Either<Failure, List<NoteModel>>> getNotes({required String uid});
}
