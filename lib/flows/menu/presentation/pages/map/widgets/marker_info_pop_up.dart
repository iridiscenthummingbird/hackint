import 'package:flutter/material.dart';
import 'package:hackint/flows/menu/presentation/pages/map/widgets/marker_type_item.dart';
import 'package:hackint/widgets/primary_button.dart';

class MarkerInfoPopUp extends StatelessWidget {
  const MarkerInfoPopUp({
    required this.title,
    required this.description,
    required this.typeColor,
    required this.onClosed,
    Key? key,
  }) : super(key: key);

  final String title;
  final String description;
  final Color typeColor;
  final VoidCallback onClosed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Desciption',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Type:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            MarkerTypeItem(
              title: 'Shop',
              color: typeColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: PrimaryButton(
                title: 'Close',
                onPressed: onClosed,
                verticalPadding: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
