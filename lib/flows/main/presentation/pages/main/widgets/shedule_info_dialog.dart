import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackint/gen/assets.gen.dart';

import '../../../../domain/entities/lesson.dart';

class SheduleInfoDialog extends StatelessWidget {
  const SheduleInfoDialog({
    required this.lesson,
    super.key,
  });

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 380,
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
                iconPath: Assets.icons.userIcon.path,
                title: 'Teacher',
                info: lesson.teacherName,
              ),
              RowInfo(
                iconPath: Assets.icons.graduateIcon.path,
                title: 'Type',
                info: lesson.type,
              ),
              RowInfo(
                iconPath: Assets.icons.classRoomIcon.path,
                title: 'Classroom',
                info: lesson.auditory,
              ),
              RowInfo(
                iconPath: Assets.icons.clockPurpleIcon.path,
                title: 'Start Time',
                info: lesson.time.format(context),
              ),
              const SizedBox(height: 45),
              Material(
                elevation: 1,
                shadowColor: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    print(lesson.buildingId);
                  },
                  child: Ink(
                    child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowInfo extends StatelessWidget {
  const RowInfo({
    super.key,
    required this.iconPath,
    required this.title,
    required this.info,
  });

  final String iconPath;
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    Theme.of(context).primaryTextTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
              ),
              const SizedBox(height: 4),
              Text(
                info,
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                      fontSize: 14,
                      color: const Color(0xff643FDB),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
