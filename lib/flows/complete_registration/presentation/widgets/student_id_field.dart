import 'package:flutter/material.dart';
import 'package:hackint/flows/complete_registration/presentation/widgets/custom_text_field.dart';

class StudentsIdField extends StatelessWidget {
  const StudentsIdField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      title: 'Student\'s ID',
      validator: (input) {
        if (input?.isEmpty ?? true) {
          return 'Students ID is required';
        }
        try {
          double parsed = double.parse(input!);
          if (parsed == 0) {
            return 'Students ID should be valid';
          }
        } catch (_) {}
        return null;
      },
    );
  }
}
