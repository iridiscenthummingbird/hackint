import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main/presentation/pages/main/widgets/custom_switch_button.dart';
import '../pages/main/cubit/teacher_main_cubit.dart';

class TeacherCustomSwitchButton extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const TeacherCustomSwitchButton({
    Key? key,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TeacherCustomSwitchButton> createState() =>
      _TeacherCustomSwitchButtonState();
}

class _TeacherCustomSwitchButtonState extends State<TeacherCustomSwitchButton> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          if (widget.onChanged != null) {
            widget.onChanged!(_value);
          }
        });
        context.read<TeacherMainCubit>().switchWeek(_value ? 1 : 0);
      },
      child: Row(
        children: [
          SwitchTile(
            value: _value,
            text: 'First',
          ),
          SwitchTile(
            value: !_value,
            text: 'Second',
          ),
        ],
      ),
    );
  }
}
