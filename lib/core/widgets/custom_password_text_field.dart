import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    required this.textController,
    required this.label,
    required this.hintText,
    required this.warningText,
    //required String? Function(value) validator,
  });

  final TextEditingController textController;
  final String label;
  final String hintText;
  final String warningText;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isVisible,
      controller: widget.textController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.warningText;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        label: Text(widget.label),
        border: OutlineInputBorder(
          borderRadius: kRadius10,
          borderSide: const BorderSide(width: 1),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          icon:
              _isVisible
                  ? const Icon(Icons.visibility_outlined)
                  : const Icon(Icons.visibility_off_outlined),
        ),
      ),
    );
  }
}
