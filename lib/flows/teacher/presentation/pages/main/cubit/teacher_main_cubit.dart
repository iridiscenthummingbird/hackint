import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hackint/domain/shared_models/api/user_model.dart';
import 'package:hackint/flows/teacher/domain/usecases/change_time.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/core/errors/failures.dart';
import '../../../../../main/domain/entities/lesson.dart';
import '../../../../domain/usecases/get_lessons.dart';

part 'teacher_main_state.dart';

@injectable
class TeacherMainCubit extends Cubit<TeacherMainState> {
  TeacherMainCubit(
    this.getTeachersLessonsUseCase,
    this.changeTimeUseCase,
  ) : super(
          const TeacherMainLoading(
            lessonsMaps: [{}],
            selectedWeek: 0,
          ),
        );

  final GetTeachersLessonsUseCase getTeachersLessonsUseCase;
  final ChangeTimeUseCase changeTimeUseCase;

  void switchWeek(int week) {
    emit(
      TeacherMainLoaded(
        lessonsMaps: state.lessonsMaps,
        selectedWeek: week,
      ),
    );
  }

  Future<void> getLessons(UserModel teacher) async {
    final result = await getTeachersLessonsUseCase(teacher);
    result.fold(
      (failure) {
        emit(
          TeacherMainError(
            failure: failure,
            selectedWeek: state.selectedWeek,
            lessonsMaps: state.lessonsMaps,
          ),
        );
      },
      (lessons) {
        final List<List<Lesson>> weeks = [];
        for (int i = 0; i < 2; i++) {
          weeks.add(lessons
              .where(
                (lesson) => lesson.weekType == i,
              )
              .toList());
        }

        final List<Map<int, List<Lesson>>> lessonsMaps = [];
        for (final week in weeks) {
          final weekMap = <int, List<Lesson>>{};

          for (int i = 0; i < 7; i++) {
            weekMap[i] = [];
          }

          for (int i = 0; i < week.length; i++) {
            for (final dayOfWeek in week[i].daysOfWeek) {
              weekMap[dayOfWeek]?.add(week[i]);
            }
          }

          lessonsMaps.add(weekMap);
        }

        emit(
          TeacherMainLoaded(
            lessonsMaps: lessonsMaps,
            selectedWeek: state.selectedWeek,
          ),
        );
      },
    );
  }

  Future<void> changeTime(
      TimeOfDay time, Lesson lesson, UserModel teacher) async {
    final f = NumberFormat('00');
    final result = await changeTimeUseCase(
      ChangeTimeParams(
        lessonId: lesson.id,
        groups: lesson.groups,
        time: time,
        title: 'WARNING!',
        description:
            'Change in schedule! The ${lesson.subjectName} lesson will be held at ${f.format(time.hour)}:${f.format(time.minute)}.',
      ),
    );
    result.fold(
      (failure) {
        emit(
          TeacherMainError(
            failure: failure,
            selectedWeek: state.selectedWeek,
            lessonsMaps: state.lessonsMaps,
          ),
        );
      },
      (_) async {
        emit(
          TeacherMainLoading(
            lessonsMaps: state.lessonsMaps,
            selectedWeek: state.selectedWeek,
          ),
        );
        await getLessons(teacher);
      },
    );
  }
}
