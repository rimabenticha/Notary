import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/core/utils/functions/custom_snack_bar.dart';
import 'package:noteary/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class SignoutButton extends StatelessWidget {
  const SignoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        }
        if (state is AuthFailure) {
          context.pop();
          customSnackBar(
            context: context,
            message: state.errMessage,
            success: false,
          );
        }
        if (state is Unauthenticated) {
          context.pop();
          context.go(AppRouter.kSignInScreen);
        }
      },
      child: TextButton(
        onPressed: () {
          context.read<AuthCubit>().signOut();
        },
        style: TextButton.styleFrom(padding: kPadd8),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: MyColors.blue,
                shape: BoxShape.circle,
              ),
              width: 40,
              height: 40,
              child: const Icon(Icons.logout, color: MyColors.yellow, size: 25),
            ),
            const SizedBox(width: 15),
            Text(
              'Sign out',
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.bold,
                color: MyColors.black.withValues(alpha: .8),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: MyColors.black.withValues(alpha: .8),
            ),
          ],
        ),
      ),
    );
  }
}
