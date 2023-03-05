import 'package:flutter/material.dart';
import 'package:hackint/flows/main/domain/entities/change_notification.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
  });

  final ChangeNotification notification;

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
                notification.title,
                style:
                    Theme.of(context).primaryTextTheme.displayLarge?.copyWith(
                          color: const Color(0xffFBBC05),
                        ),
              ),
              const SizedBox(height: 8),
              Text(
                notification.description,
                style: Theme.of(context).primaryTextTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat('HH:mm dd.MM.yyyy').format(notification.dateTime),
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                      color: const Color(0xFF1C1243).withOpacity(0.8),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
