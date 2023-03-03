import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final email = FirebaseAuth.instance.currentUser?.email;
    String userName = '';
    if (email != null) {
      userName = email.split('@')[0];
    }
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
                'Beluga Time',
                style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                      color: Theme.of(context).primaryColorLight,
                    ),
              ),
              const SizedBox(height: 32),
              CustomMenuItem(
                itemText: userName,
                iconPath: Assets.icons.userProfileIcon.path,
              ),
              const SizedBox(height: 12),
              Container(
                height: 1,
                width: double.infinity,
                color: const Color(0xFFFFFFFF).withOpacity(0.3),
              ),
              const SizedBox(height: 16),
              CustomMenuItem(
                itemText: 'Calendar',
                iconPath: Assets.icons.calendarIcon.path,
                // TODO: go to CalendarPage
                //onTap: () => Routemaster.of(context).push(CalendarPage.path),
              ),
              const SizedBox(height: 16),
              CustomMenuItem(
                itemText: 'Find Event',
                iconPath: Assets.icons.searchIcon.path,
                // TODO: go to FindEvent(mainPage?)
                // onTap: () async {
                //   final result = await Routemaster.of(context)
                //       .push<bool>(FindEventPage.path)
                //       .result;
                //   if (result ?? false) {
                //     context.read<MainPageCubit>().loadEvents(
                //           (context.read<AppStateCubit>().state
                //                   as AuthorizedState)
                //               .user,
                //         );
                //   }
                // },
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
