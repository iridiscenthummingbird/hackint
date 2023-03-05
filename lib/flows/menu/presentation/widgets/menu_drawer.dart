import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackint/flows/menu/presentation/pages/map/map_page.dart';
import 'package:hackint/flows/menu/presentation/pages/notifications/notifications_page.dart';
import 'package:hackint/flows/menu/presentation/pages/profile/profile.dart';
import 'package:routemaster/routemaster.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../navigation/app_state_cubit/app_state_cubit.dart';
import 'custom_menu_item.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AppStateCubit>().state as AuthorizedState).user;
    return Drawer(
      width: (MediaQuery.of(context).size.width + 100) / 2,
      backgroundColor: const Color(0xff643FDB),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              SvgPicture.asset(Assets.beluga.path),
              const SizedBox(height: 16),
              Text(
                'Beluga Study',
                style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                      color: Theme.of(context).primaryColorLight,
                    ),
              ),
              const SizedBox(height: 32),
              CustomMenuItem(
                itemText: user.name!,
                iconPath: Assets.icons.userCircle.path,
              ),
              const SizedBox(height: 12),
              Container(
                height: 1,
                width: double.infinity,
                color: const Color(0xFFFFFFFF).withOpacity(0.3),
              ),
              const SizedBox(height: 16),
              CustomMenuItem(
                itemText: 'Profile',
                iconPath: Assets.icons.userProfileIcon.path,
                onTap: () {
                  Routemaster.of(context).push(ProfilePage.path);
                },
              ),
              const SizedBox(height: 16),
              CustomMenuItem(
                itemText: 'Notifications',
                iconPath: Assets.icons.notification.path,
                onTap: () {
                  Routemaster.of(context).push(NotificationsPage.path);
                },
              ),
              const SizedBox(height: 16),
              CustomMenuItem(
                itemText: 'University map',
                iconPath: Assets.icons.universityMap.path,
                onTap: () {
                  Routemaster.of(context).push(MapPage.path);
                },
              ),
              const Spacer(),
              CustomMenuItem(
                itemText: 'Log out',
                iconPath: Assets.icons.logOutIcon.path,
                onTap: () => context.read<AppStateCubit>().logOut(),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
