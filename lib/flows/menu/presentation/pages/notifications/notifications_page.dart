import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackint/flows/menu/presentation/pages/notifications/cubit/notifications_cubit.dart';
import 'package:hackint/flows/menu/presentation/pages/widgets/notification_card.dart';
import 'package:hackint/gen/assets.gen.dart';
import 'package:hackint/services/injectible/injectible_init.dart';
import 'package:hackint/widgets/circular_loading.dart';
import 'package:routemaster/routemaster.dart';

import '../../../../../navigation/app_state_cubit/app_state_cubit.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static const String path = '/notifications_page';

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AppStateCubit>().state as AuthorizedState).user;

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
      body: BlocProvider(
        create: (context) =>
            getIt<NotificationsCubit>()..getNotifications(user.group!),
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationsLoading) {
              return const CircularLoading();
            } else if (state.notifications.isEmpty) {
              return Center(
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
              );
            } else {
              return ListView.separated(
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: NotificationCard(
                      notification: state.notifications[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 12);
                },
              );
            }
          },
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
