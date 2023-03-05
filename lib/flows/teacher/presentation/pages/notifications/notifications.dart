import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackint/gen/assets.gen.dart';
import 'package:routemaster/routemaster.dart';

class TeacherNotificationsPage extends StatelessWidget {
  const TeacherNotificationsPage({super.key});

  static const String path = '/notifications_page';

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
        ),
      ),
      body: Center(
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
