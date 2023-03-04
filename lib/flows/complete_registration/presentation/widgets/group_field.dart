import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:hackint/flows/complete_registration/presentation/pages/cubit/complete_registration_cubit.dart';

class GroupField extends StatelessWidget {
  const GroupField({
    required this.groups,
    super.key,
  });

  final List<Group> groups;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final errorColor = Theme.of(context).colorScheme.error;
    return DropDownTextField(
      onChanged: (value) {
        Group? group;
        if (value is DropDownValueModel) {
          group = value.value;
        } else if (value == '') {
          group = null;
        }
        context.read<CompleteRegistrationCubit>().chooseGroup(group);
      },
      dropDownIconProperty: IconProperty(color: primaryColor),
      clearIconProperty: IconProperty(color: primaryColor),
      textStyle: TextStyle(
        fontSize: 16,
        color: primaryColor,
      ),
      textFieldDecoration: InputDecoration(
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
        labelText: 'Group',
        labelStyle: TextStyle(
          fontSize: 16,
          color: primaryColor,
        ),
      ),
      dropDownList: groups
          .map(
            (group) => DropDownValueModel(
              name: group.name,
              value: group,
            ),
          )
          .toList(),
      validator: (input) {
        if (input != null) {
          return input.isEmpty ? 'Group is required' : null;
        }
        return null;
      },
    );
  }
}
