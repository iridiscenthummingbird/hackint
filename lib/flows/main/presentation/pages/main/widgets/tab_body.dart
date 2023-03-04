import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackint/flows/main/domain/entities/lesson.dart';
import 'package:hackint/flows/main/presentation/pages/main/cubit/main_cubit.dart';
import 'package:hackint/flows/main/presentation/pages/main/widgets/shedule_tile.dart';

import '../../../../../../navigation/app_state_cubit/app_state_cubit.dart';

class TabBody extends StatelessWidget {
  const TabBody({
    super.key,
    required this.lessons,
  });

  final List<Lesson> lessons;

  @override
  Widget build(BuildContext context) {
    if (lessons.isEmpty) {
      return const Center(
        child: Text('No lessons'),
      );
    }
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
              number: index + 1,
              category: lesson.type,
              name: lesson.subjectName,
              auditory: lesson.auditory,
              time: lesson.time,
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
