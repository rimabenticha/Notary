import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/core/utils/assets.dart';
import 'package:noteary/features/auth/presentation/views/widgets/sign_up_form.dart';

class SignupScreenBody extends StatelessWidget {
  const SignupScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPadd16,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.045),
          Text(
            'Sign up',
            style: Styles.textStyle28.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          const Image(
            image: AssetImage(AssetsData.signUpIllustration),
            width: 250,
          ),

          const SignUpForm(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Do you have an account?',
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 4),
              TextButton(
                onPressed: () {
                  context.push(AppRouter.kSignInScreen);
                },
                child: const Text('Sign in', style: Styles.textStyle16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
