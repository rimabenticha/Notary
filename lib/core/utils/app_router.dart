import 'package:go_router/go_router.dart';
import 'package:noteary/features/auth/presentation/views/signin_screen.dart';
import 'package:noteary/features/auth/presentation/views/signup_screen.dart';
import 'package:noteary/features/home/presentation/views/home_screen.dart';
import 'package:noteary/features/navigation_menu.dart';
import 'package:noteary/features/notes/presentation/views/new_note_screen.dart';
import 'package:noteary/features/notes/presentation/views/note_content_screen.dart';
import 'package:noteary/features/profile/presentation/views/personal_data_screen.dart';

abstract class AppRouter {
  static const String kSignInScreen = '/';
  static const String kSignUpScreen = '/singUpScreen';
  static const String kNavigationMenu = '/navigationMenu';
  static const String kHomeScreen = '/homeScreen';
  static const String kNewNoteScreen = '/newNoteScreen';
  static const String kNoteConentScreen = '/noteConentScreen';
  static const String kPersonalDataScreen = '/personalDataScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SigninScreen()),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: kNavigationMenu,
        builder: (context, state) => const NavigationMenu(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kNewNoteScreen,
        builder: (context, state) => const NewNoteScreen(),
      ),
      GoRoute(
        path: kNoteConentScreen,
        builder: (context, state) => const NoteContentScreen(),
      ),
      GoRoute(
        path: kPersonalDataScreen,
        builder: (context, state) => const PersonalDataScreen(),
      ),
    ],
  );
}
