import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

import '../../../../domain/shared_models/api/user_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../navigation/app_state_cubit/app_state_cubit.dart';
import '../../../main/domain/entities/lesson.dart';
import '../../../main/presentation/pages/main/widgets/shedule_info_dialog.dart';
import '../../../menu/presentation/pages/map/map_page.dart';

class TeacherSheduleInfoDialog extends StatelessWidget {
  const TeacherSheduleInfoDialog({
    required this.lesson,
    required this.changeTime,
    super.key,
  });

  final Lesson lesson;
  final void Function(
    TimeOfDay time,
    Lesson lesson,
    UserModel teacher,
  ) changeTime;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 410,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                lesson.subjectName,
                style:
                    Theme.of(context).primaryTextTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
              ),
              RowInfo(
                iconPath: Assets.icons.group.path,
                title: 'Groups',
                info: lesson.groups
                    .map((group) => group.name)
                    .toList()
                    .join(', '),
              ),
              RowInfo(
                iconPath: Assets.icons.graduateIcon.path,
                title: 'Type',
                info: lesson.type,
              ),
              RowInfo(
                iconPath: Assets.icons.classRoomIcon.path,
                title: 'Classroom/Building',
                info: '${lesson.auditory}/${lesson.buildingName}',
              ),
              RowInfo(
                iconPath: Assets.icons.clockPurpleIcon.path,
                title: 'Start Time',
                info: lesson.time.format(context),
              ),
              const SizedBox(height: 25),
              Material(
                elevation: 1,
                shadowColor: Colors.grey.shade100,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  onTap: () {
                    Routemaster.of(context).push(
                      MapPage.path,
                      queryParameters: {
                        'markerId': lesson.buildingId,
                      },
                    );
                  },
                  child: Ink(
                    width: 250,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xff643FDB),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Center(
                      child: Text(
                        'Show building location',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .displayLarge
                            ?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color(0xffFFFFFF),
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Material(
                elevation: 1,
                shadowColor: Colors.grey.shade100,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData(
                            timePickerTheme: const TimePickerThemeData(
                              dialBackgroundColor: Colors.white,
                            ),
                            colorScheme: ColorScheme.light(
                              primary: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (time != null) {
                      changeTime(
                        time,
                        lesson,
                        (context.read<AppStateCubit>().state as AuthorizedState)
                            .user,
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Ink(
                    width: 250,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xff643FDB),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Center(
                      child: Text(
                        'Change time',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .displayLarge
                            ?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color(0xffFFFFFF),
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
