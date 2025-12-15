import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/utils/functions/custom_snack_bar.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_password_text_field.dart';
import 'package:noteary/features/profile/presentation/manager/update_password_cubit/update_password_cubit.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({super.key});

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatePasswordCubit, UpdatePasswordState>(
      listener: (context, state) async {
        if (state is ReAuthenticationLoading) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is ReAuthenticationSuccess) {
          context.pop();
          if (_currentPasswordController.text.trim() ==
              _newPasswordController.text.trim()) {
            customSnackBar(
              context: context,
              message:
                  'The new password must be different from the current password!',
              success: false,
            );
          } else {
            await context.read<UpdatePasswordCubit>().updatePassword(
              newPassword: _newPasswordController.text.trim(),
            );
          }
        } else if (state is ReAuthenticationFailure) {
          context.pop();
          customSnackBar(
            context: context,
            message: state.errMessage,
            success: false,
          );
        } else if (state is UpdatePasswordLoading) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is UpdatePasswordSuccess) {
          context.pop();
          context.pop();
          customSnackBar(
            context: context,
            message: 'Password updated successfully!',
            success: true,
          );
        } else if (state is UpdatePasswordFailure) {
          context.pop();
          customSnackBar(
            context: context,
            message: state.errMessage,
            success: false,
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomPasswordTextField(
              textController: _currentPasswordController,
              label: 'Current Password',
              hintText: 'Enter your current password',
              warningText: 'Please enter your current password!',
            ),
            const SizedBox(height: 15),
            CustomPasswordTextField(
              textController: _newPasswordController,
              label: 'New Password',
              hintText: 'Enter your new password',
              warningText: 'Please enter your new password!',
            ),
            const SizedBox(height: 15),
            CustomPasswordTextField(
              textController: _confirmNewPasswordController,
              label: 'Confirm New Password',
              hintText: 'Enter your new password',
              warningText: 'Please enter your new password!',
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              label: 'Update',
              onPressed: () async {
                final bool isValid = _formKey.currentState!.validate();
                if (isValid) {
                  if (_newPasswordController.text.trim() !=
                      _confirmNewPasswordController.text.trim()) {
                    customSnackBar(
                      context: context,
                      message: 'Passwords do not match!',
                      success: false,
                    );
                  } else {
                    await context
                        .read<UpdatePasswordCubit>()
                        .reAuthenticateUser(
                          oldPassword: _currentPasswordController.text.trim(),
                        );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
