import 'package:flutter/material.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_text_form_field.dart';
import 'package:noteary/features/auth/data/models/user_model.dart';

class PersonalDataForm extends StatefulWidget {
  const PersonalDataForm({super.key, required this.user});

  final UserModel user;

  @override
  State<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fullNameController.text = widget.user.fullName ?? '';
    _emailController.text = widget.user.email ?? '';
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            textController: _fullNameController,
            label: 'Full name',
            hintText: 'Enter your first name',
            warningText: 'Please enter your first name!',
          ),
          SizedBox(height: 15),
          CustomTextFormField(
            enabled: false,
            textController: _emailController,
            label: 'Email',
            hintText: 'Enter your email',
            warningText: 'Please enter your email!',
          ),
          SizedBox(height: 15),
          CustomElevatedButton(
            label: 'Save Changes',
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
