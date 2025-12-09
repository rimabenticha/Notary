import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/core/utils/assets.dart';
import 'package:noteary/features/auth/presentation/views/widgets/sign_in_form.dart';

class SigninScreenBody extends StatelessWidget {
  const SigninScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPadd16,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.075),
          Text(
            'Sign in',
            style: Styles.textStyle28.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          const Image(
            image: AssetImage(AssetsData.signInIllustration),
            width: 250,
          ),
          SignInForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You don\'t have an account?',
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 4),
              TextButton(
                onPressed: () {
                  context.push(AppRouter.kSignUpScreen);
                },
                child: const Text('Sign Up', style: Styles.textStyle16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
