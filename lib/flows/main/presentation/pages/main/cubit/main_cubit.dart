import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:hackint/flows/main/domain/usecase/get_lessons.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/lesson.dart';

part 'main_state.dart';

@injectable
class MainCubit extends Cubit<MainState> {
  MainCubit(this.getLessonsUseCase)
      : super(
          const MainLoading(
            lessonsMaps: [{}],
            selectedWeek: 0,
          ),
        );

  final GetLessonsUseCase getLessonsUseCase;

  void switchWeek(int week) {
    emit(
      MainLoaded(
        lessonsMaps: state.lessonsMaps,
        selectedWeek: week,
      ),
    );
  }

  Future<void> getLessons(Group group) async {
    final result = await getLessonsUseCase(group);
    result.fold(
      (failure) {
        emit(
          MainError(
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
          MainLoaded(
            lessonsMaps: lessonsMaps,
            selectedWeek: state.selectedWeek,
          ),
        );
      },
    );
  }
}
