import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackint/flows/menu/presentation/pages/widgets/notification_card.dart';
import 'package:hackint/gen/assets.gen.dart';
import 'package:routemaster/routemaster.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  //TODO added to navigator
  static const String path = '/notifications_page';

  final List<MyNotification> listNotifications = const [
    MyNotification(
      title: 'Warning',
      description: 'Change in schedule! The 5th lesson will be held at 12:00.',
    ),
    MyNotification(
      title: 'Warning',
      description: 'Change in schedule! The 5th lesson will be held at 12:00.',
    ),
    MyNotification(
      title: 'Warning',
      description: 'Change in schedule! The 5th lesson will be held at 12:00.',
    ),
    MyNotification(
      title: 'Warning',
      description: 'Change in schedule! The 5th lesson will be held at 12:00.',
    ),
    MyNotification(
      title: 'Warning',
      description: 'Change in schedule! The 5th lesson will be held at 12:00.',
    ),
    MyNotification(
      title: 'Warning',
      description: 'Change in schedule! The 5th lesson will be held at 12:00.',
    ),
    MyNotification(
      title: 'Warning',
      description: 'Change in schedule! The 5th lesson will be held at 12:00.',
    ),
    MyNotification(
      title: 'Warning',
      description: 'Change in schedule! The 5th lesson will be held at 12:00.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Theme.of(context).primaryTextTheme.displayLarge,
        ),
        leading: IconButton(
          onPressed: () {
            Routemaster.of(context).pop();
          },
          icon: SvgPicture.asset(
            Assets.icons.back.path,
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
          splashRadius: 20,
        ),
      ),
      body: ListView.builder(
        itemCount: listNotifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
            child: NotificationCard(
              title: listNotifications[index].title,
              description: listNotifications[index].description,
            ),
          );
        },
      ),
    );
  }
}

class MyNotification {
  final String title;
  final String description;

  const MyNotification({
    required this.title,
    required this.description,
  });
}
