import 'package:flutter/material.dart';
import 'package:stream_video_app/core/theme/app_colors.dart';

class CustomeTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  const CustomeTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: 'Your Name',
        contentPadding: EdgeInsets.fromLTRB(16, 10, 0, 10),
      ),
    );
  }
}
