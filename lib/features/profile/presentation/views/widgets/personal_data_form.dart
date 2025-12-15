import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_text_form_field.dart';

class PersonalDataForm extends StatefulWidget {
  const PersonalDataForm({super.key});

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
    _fullNameController.text =
        getIt.get<FirebaseAuth>().currentUser?.displayName ?? '';
    _emailController.text = getIt.get<FirebaseAuth>().currentUser?.email ?? '';
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
          const SizedBox(height: 15),
          CustomTextFormField(
            enabled: false,
            textController: _emailController,
            label: 'Email',
            hintText: 'Enter your email',
            warningText: 'Please enter your email!',
          ),
          const SizedBox(height: 15),
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
