import 'package:flutter/material.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_text_form_field.dart';

class ContactUsForm extends StatefulWidget {
  const ContactUsForm({super.key});

  @override
  State<ContactUsForm> createState() => _ContactUsFormState();
}

class _ContactUsFormState extends State<ContactUsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            textController: _nameController,
            label: 'Name',
            hintText: 'Enter your name',
            warningText: 'Please enter your name!',
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            textController: _emailController,
            label: 'Email',
            hintText: 'Enter your email',
            warningText: 'Please enter your email!',
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            textController: _messageController,
            label: 'Message',
            hintText: 'Enter your message',
            warningText: 'Please enter your message!',
            maxLines: 5,
            maxLength: 300,
          ),
          const SizedBox(height: 20),
          CustomElevatedButton(
            label: 'Send',
            onPressed: () {
              final bool isValid = _formKey.currentState!.validate();
              if (isValid) {
                // TODO: add send method
              }
            },
          ),
        ],
      ),
    );
  }
}
