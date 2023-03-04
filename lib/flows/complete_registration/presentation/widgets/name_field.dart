import 'package:flutter/material.dart';
import 'package:hackint/flows/complete_registration/presentation/widgets/custom_text_field.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      title: title,
      validator: (input) {
        if (input != null) {
          return input.isEmpty ? 'Name is required' : null;
        }
        return null;
      },
    );
  }
}
