import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackint/flows/menu/presentation/pages/widgets/notification_card.dart';
import 'package:hackint/gen/assets.gen.dart';
import 'package:routemaster/routemaster.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static const String path = '/notifications_page';

  @override
  Widget build(BuildContext context) {
    final List<MyNotification> notifications = List.generate(
      Random().nextInt(3),
      (index) => const MyNotification(
        title: 'Warning',
        description:
            'Change in schedule! The 5th lesson will be held at 12:00.',
      ),
    );
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
        ),
      ),
      body: notifications.isNotEmpty
          ? ListView.separated(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: NotificationCard(
                    title: notifications[index].title,
                    description: notifications[index].description,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.noDisturb.path,
                    height: 150,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'No notifications',
                    style: GoogleFonts.rubik(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
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
