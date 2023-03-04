import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.title,
    required this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final errorColor = Theme.of(context).colorScheme.error;
    return TextFormField(
      controller: controller,
      cursorColor: primaryColor,
      style: TextStyle(
        fontSize: 16,
        color: primaryColor,
      ),
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        labelText: title,
        labelStyle: TextStyle(
          fontSize: 16,
          color: primaryColor,
        ),
      ),
      validator:validator,
    );
  }
}
