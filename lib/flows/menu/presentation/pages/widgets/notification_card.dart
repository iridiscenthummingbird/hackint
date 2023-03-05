import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 3,
        shadowColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    Theme.of(context).primaryTextTheme.displayLarge?.copyWith(
                          color: const Color(0xffFBBC05),
                        ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).primaryTextTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
