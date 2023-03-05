import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackint/flows/teacher/presentation/widgets/drawer.dart';

import '../../../../../navigation/app_state_cubit/app_state_cubit.dart';
import '../../../../../services/injectible/injectible_init.dart';
import '../../../../../widgets/circular_loading.dart';
import '../../../../main/presentation/pages/main/widgets/tab_body.dart';
import '../../widgets/switch.dart';
import 'cubit/teacher_main_cubit.dart';

class TeacherMainPage extends StatelessWidget {
  const TeacherMainPage({super.key});

  static String path = '/';

  final week = const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AppStateCubit>().state as AuthorizedState).user;

    return BlocProvider(
      create: (context) => getIt<TeacherMainCubit>()..getLessons(user),
      child: DefaultTabController(
        length: week.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Shedule',
              style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff1C1243),
                  ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: TeacherCustomSwitchButton(
                  initialValue: false,
                ),
              ),
            ],
            bottom: TabBar(
              labelStyle: GoogleFonts.rubik(
                color: Theme.of(context).appBarTheme.foregroundColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              indicatorColor: Colors.transparent,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor:
                  Theme.of(context).appBarTheme.foregroundColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor.withOpacity(0.15),
              ),
              tabs: week.map((day) => Tab(text: day)).toList(),
            ),
          ),
          drawer: const TeacherMenuDrawer(),
          body: BlocBuilder<TeacherMainCubit, TeacherMainState>(
            builder: (context, state) {
              if (state is TeacherMainLoading) {
                return const CircularLoading();
              }
              return TabBarView(
                children: List.generate(week.length, (index) => index)
                    .map(
                      (index) => TabBody(
                        isTeacher: true,
                        lessons:
                            state.lessonsMaps[state.selectedWeek][index] ?? [],
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
