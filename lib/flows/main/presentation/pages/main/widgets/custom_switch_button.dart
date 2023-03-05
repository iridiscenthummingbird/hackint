import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackint/flows/main/presentation/pages/main/cubit/main_cubit.dart';

class CustomSwitchButton extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const CustomSwitchButton({
    Key? key,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
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
        context.read<MainCubit>().switchWeek(_value ? 1 : 0);
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

class SwitchTile extends StatelessWidget {
  const SwitchTile({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 85,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(4),
        color: value ? Colors.white : const Color(0xff643FDB),
      ),
      child: Center(
        child: Text(
          text,
          style: value
              ? Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    fontSize: 18,
                  )
              : Theme.of(context).primaryTextTheme.displayLarge?.copyWith(
                    color: Colors.white,
                  ),
        ),
      ),
    );
  }
}
