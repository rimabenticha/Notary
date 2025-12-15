import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textController,
    required this.label,
    required this.hintText,
    required this.warningText,
    this.maxLines,
    this.maxLength,
    this.keyboardType,
    this.isRequired,
    this.enabled = true,
  });

  final TextEditingController textController;
  final String label;
  final String hintText;
  final String warningText;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool? isRequired;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: textController,
      validator: isRequired == false
          ? null
          : (value) {
              if (value == null || value.isEmpty) {
                return warningText;
              }
              return null;
            },
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: kRadius10,
          borderSide: const BorderSide(width: 1),
        ),
      ),
    );
  }
}
