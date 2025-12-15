import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/utils/functions/custom_snack_bar.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_text_form_field.dart';
import 'package:noteary/features/profile/presentation/manager/update_personal_data_cubit/update_personal_data_cubit.dart';

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
    return BlocListener<UpdatePersonalDataCubit, UpdatePersonalDataState>(
      listener: (context, state) {
        if (state is UpdatePersonalDataLoading) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is UpdatePersonalDataSuccess) {
          context.pop();
          context.pop();
          customSnackBar(
            context: context,
            message: 'Personal data updated successfully!',
            success: true,
          );
        } else if (state is UpdatePersonalDataFailure) {
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
              textController: _fullNameController,
              label: 'Full name',
              hintText: 'Enter your first name',
              warningText: 'Please enter your first name!',
              maxLines: 1,
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
              label: 'Update',
              onPressed: () async {
                final bool isValid = _formKey.currentState!.validate();
                if (isValid) {
                  if (_fullNameController.text.trim() !=
                      getIt.get<FirebaseAuth>().currentUser?.displayName) {
                    await context
                        .read<UpdatePersonalDataCubit>()
                        .updatePersonalData(
                          fullName: _fullNameController.text.trim(),
                        );
                  } else {
                    customSnackBar(
                      context: context,
                      message: 'Please enter a new full name',
                      success: false,
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
