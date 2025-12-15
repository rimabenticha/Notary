import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:noteary/features/auth/presentation/views/forgot_password_screen.dart';
import 'package:noteary/features/auth/presentation/views/signin_screen.dart';
import 'package:noteary/features/auth/presentation/views/signup_screen.dart';
import 'package:noteary/features/home/presentation/views/home_screen.dart';
import 'package:noteary/features/navigation_menu.dart';
import 'package:noteary/features/notes/presentation/views/new_note_screen.dart';
import 'package:noteary/features/notes/presentation/views/note_content_screen.dart';
import 'package:noteary/features/profile/presentation/views/contact_us_screen.dart';
import 'package:noteary/features/profile/presentation/views/password_screen.dart';
import 'package:noteary/features/profile/presentation/views/personal_data_screen.dart';

abstract class AppRouter {
  static const String kSignInScreen = '/';
  static const String kSignUpScreen = '/singUpScreen';
  static const String kNavigationMenu = '/navigationMenu';
  static const String kHomeScreen = '/homeScreen';
  static const String kNewNoteScreen = '/newNoteScreen';
  static const String kNoteConentScreen = '/noteConentScreen';
  static const String kPersonalDataScreen = '/personalDataScreen';
  static const String kPasswordScreen = '/passwordScreen';
  static const String kContactUsScreen = '/contactUsScreen';
  static const String kForgotPasswordScreen = '/forgotPasswordScreen';

  static AuthCubit? _authCubit;
  static void initialize(AuthCubit authCubit) {
    _authCubit = authCubit;
  }

  static final router = GoRouter(
    observers: [routeObserver],
    initialLocation: kSignInScreen,
    refreshListenable: _authCubit != null
        ? GoRouterRefreshStream(_authCubit!.stream)
        : null,
    redirect: (context, state) {
      if (_authCubit == null) return null;
      final authState = _authCubit!.state;
      final currentLocation = state.matchedLocation;

      if (authState is Authenticated) {
        if (currentLocation == kSignInScreen ||
            currentLocation == kSignUpScreen) {
          return kNavigationMenu;
        }
      }

      if (authState is Unauthenticated) {
        if (currentLocation != kSignInScreen &&
            currentLocation != kSignUpScreen &&
            currentLocation != kForgotPasswordScreen) {
          return kSignInScreen;
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: kSignInScreen,
        builder: (context, state) => const SigninScreen(),
      ),
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
      GoRoute(
        path: kPasswordScreen,
        builder: (context, state) => const PasswordScreen(),
      ),
      GoRoute(
        path: kContactUsScreen,
        builder: (context, state) => const ContactUsScreen(),
      ),
      GoRoute(
        path: kForgotPasswordScreen,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
    ],
  );
}

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
