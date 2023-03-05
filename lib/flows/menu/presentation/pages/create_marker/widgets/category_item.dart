import 'package:flutter/material.dart';
import 'package:hackint/domain/shared_models/api/marker_type.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.markerType,
    required this.onPressed,
    this.isSelected = false,
    super.key,
  });

  final MarkerType markerType;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? const Color(0xffFF8A00)
                : Theme.of(context).primaryColor,
          ),
          color: isSelected
              ? const Color(0xffFF8A00).withOpacity(0.8)
              : Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Text(
          markerType.name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.white : Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
