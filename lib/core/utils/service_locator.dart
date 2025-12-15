import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:noteary/core/utils/auth_services.dart';
import 'package:noteary/features/auth/data/repos/auth_repo_impl.dart';
import 'package:noteary/features/notes/data/repos/notes_repo_impl.dart';
import 'package:noteary/features/profile/data/repos/profile_repo_impl.dart';
import 'package:uuid/uuid.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<Uuid>(const Uuid());

  getIt.registerSingleton<AuthServices>(AuthServices());
  //getIt.registerSingleton<FirebaseServices>(FirebaseServices());

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(authService: getIt.get<AuthServices>()),
  );

  getIt.registerSingleton<NotesRepoImpl>(NotesRepoImpl());

  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(authService: getIt.get<AuthServices>()),
  );

  // getIt.registerSingleton<HomeRepoImpl>(
  //   //HomeRepoImpl(HomeRemoteDataSourceImpl()),
  // );

  //  // getIt.registerSingleton<SettingsRepoImpl>(
  //     //SettingsRepoImpl(
  //       SettingsRemoteDataSourceImpl(),
  //       authService: getIt.get<AuthServices>(),
  //     ),
  //   );
}
