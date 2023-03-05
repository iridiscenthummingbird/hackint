import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackint/flows/main/domain/entities/lesson.dart';
import 'package:hackint/flows/main/presentation/pages/main/widgets/shedule_info_dialog.dart';
import 'package:hackint/gen/assets.gen.dart';

import '../../../../../../domain/shared_models/api/user_model.dart';
import '../../../../../teacher/presentation/widgets/teacher_dialog.dart';

class SheduleTile extends StatelessWidget {
  const SheduleTile({
    super.key,
    required this.lesson,
    required this.number,
    this.isTeacher = false,
    required this.changeTime,
  });

  final Lesson lesson;
  final int number;
  final bool isTeacher;
  final void Function(TimeOfDay, Lesson, UserModel) changeTime;

  Color colorFromCategory(String category) {
    switch (category) {
      case 'Lecture':
        return const Color(0xFF3BC91D);
      case 'Practice':
        return const Color(0xFF4285F4);
      case 'Laboratory':
        return const Color(0xFFFBBC05);
      default:
        return const Color(0xFF3BC91D);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String name = lesson.subjectName;
    final String category = lesson.type;
    final String auditory = lesson.auditory;
    final TimeOfDay time = lesson.time;
    return Material(
      elevation: 1,
      shadowColor: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            if (isTeacher) {
              return TeacherSheduleInfoDialog(
                lesson: lesson,
                changeTime: changeTime,
              );
            } else {
              return SheduleInfoDialog(lesson: lesson);
            }
          },
        ),
        child: Ink(
          child: SizedBox(
            width: 380,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff643FDB),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        height: 32,
                        width: 32,
                        child: Center(
                          child: Text(
                            '$number',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .displayLarge
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        name,
                        style: Theme.of(context).primaryTextTheme.displayLarge,
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: colorFromCategory(category),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        height: 32,
                        width: 90,
                        child: Center(
                          child: Text(
                            category,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.icons.clockIcon.path),
                      const SizedBox(width: 10),
                      Text(
                        time.format(context),
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        auditory,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .displayLarge
                            ?.copyWith(
                              fontSize: 16,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
