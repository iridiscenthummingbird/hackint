import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackint/flows/menu/presentation/widgets/profile_card.dart';
import 'package:hackint/gen/assets.gen.dart';
import 'package:routemaster/routemaster.dart';

import '../../../../../navigation/app_state_cubit/app_state_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static String path = '/profile';

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AppStateCubit>().state as AuthorizedState).user;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Routemaster.of(context).pop();
          },
          icon: SvgPicture.asset(
            Assets.icons.back.path,
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AppStateCubit>().logOut();
            },
            icon: SvgPicture.asset(
              Assets.icons.logOutIcon.path,
              color: Theme.of(context).appBarTheme.foregroundColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).primaryColor,
                child: SizedBox(
                  height: 40,
                  child: SvgPicture.asset(Assets.beluga.path),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                user.name!,
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 24),
              ProfileCard(
                iconPath: Assets.icons.studentCard.path,
                title: 'Student\'s ID',
                text: user.studentId!,
              ),
              const SizedBox(height: 16),
              ProfileCard(
                iconPath: Assets.icons.group.path,
                title: 'Group',
                text: user.group!.name,
              ),
              const SizedBox(height: 16),
              ProfileCard(
                iconPath: Assets.icons.email.path,
                title: 'Email',
                text: user.email!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
