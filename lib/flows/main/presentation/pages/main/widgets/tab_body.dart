import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackint/flows/main/domain/entities/lesson.dart';
import 'package:hackint/flows/main/presentation/pages/main/cubit/main_cubit.dart';
import 'package:hackint/flows/main/presentation/pages/main/widgets/shedule_tile.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../../navigation/app_state_cubit/app_state_cubit.dart';

class TabBody extends StatelessWidget {
  const TabBody({
    super.key,
    required this.lessons,
  });

  final List<Lesson> lessons;

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  @override
  Widget build(BuildContext context) {
    if (lessons.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.icons.graduateIcon.path,
            height: 150,
          ),
          const SizedBox(height: 10),
          Text(
            'No lessons',
            style: GoogleFonts.rubik(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 80),
        ],
      );
    }
    lessons.sort(
      (a, b) => toDouble(a.time).compareTo(
        toDouble(b.time),
      ),
    );
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () async {
        final user =
            (context.read<AppStateCubit>().state as AuthorizedState).user;

        return await context.read<MainCubit>().getLessons(user.group!);
      },
      child: ListView.separated(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            child: SheduleTile(
              lesson: lesson,
              number: index + 1,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
