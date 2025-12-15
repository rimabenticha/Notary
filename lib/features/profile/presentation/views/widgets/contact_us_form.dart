import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/utils/functions/custom_snack_bar.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_text_form_field.dart';
import 'package:noteary/features/profile/data/models/contact_us_model.dart';
import 'package:noteary/features/profile/presentation/manager/contact_us_cubit/contact_us_cubit.dart';

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
    return BlocListener<ContactUsCubit, ContactUsState>(
      listener: (context, state) {
        if (state is ContactUsLoading) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is ContactUsSuccess) {
          context.pop();
          context.pop();
          customSnackBar(
            context: context,
            message: 'Message sent successfully!',
            success: true,
          );
        } else if (state is ContactUsFailure) {
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
            CustomTextFormField(
              textController: _nameController,
              label: 'Name',
              hintText: 'Enter your name',
              warningText: 'Please enter your name!',
              maxLines: 1,
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              textController: _emailController,
              label: 'Email',
              hintText: 'Enter your email',
              warningText: 'Please enter your email!',
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
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
              onPressed: () async {
                final bool isValid = _formKey.currentState!.validate();
                if (isValid) {
                  await context.read<ContactUsCubit>().sendContactUs(
                    contactUs: ContactUsModel(
                      uid: getIt.get<FirebaseAuth>().currentUser?.uid,
                      name: _nameController.text.trim(),
                      email: _emailController.text.trim(),
                      message: _messageController.text.trim(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
