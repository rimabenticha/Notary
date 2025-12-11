import 'package:flutter/material.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_password_text_field.dart';

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomPasswordTextField(
            textController: _currentPasswordController,
            label: 'Current Password',
            hintText: 'Enter your current password',
            warningText: 'Please enter your current password!',
          ),
          SizedBox(height: 15),
          CustomPasswordTextField(
            textController: _newPasswordController,
            label: 'New Password',
            hintText: 'Enter your new password',
            warningText: 'Please enter your new password!',
          ),
          SizedBox(height: 15),
          CustomPasswordTextField(
            textController: _confirmNewPasswordController,
            label: 'Confirm New Password',
            hintText: 'Enter your new password',
            warningText: 'Please enter your new password!',
          ),
          SizedBox(height: 20),
          CustomElevatedButton(
            label: 'Update Password',
            onPressed: () {
              final bool isValid = _formKey.currentState!.validate();
              if (isValid) {
                // TODO: add update method
              }
            },
          ),
        ],
      ),
    );
  }
}
