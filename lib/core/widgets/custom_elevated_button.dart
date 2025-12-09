import 'package:flutter/material.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/styles/sizes.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height,
  });

  // final Color backgroundColor;
  // final Color foregroundColor;
  final String label;
  final void Function()? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: kRadius10),
        minimumSize: Size(width ?? double.infinity, height ?? 40),
        backgroundColor: MyColors.blue,
        foregroundColor: MyColors.white,
      ),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
