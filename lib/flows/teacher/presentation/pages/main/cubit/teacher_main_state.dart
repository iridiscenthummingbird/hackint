part of 'teacher_main_cubit.dart';

abstract class TeacherMainState extends Equatable {
  const TeacherMainState({
    required this.lessonsMaps,
    required this.selectedWeek,
  });

  final List<Map<int, List<Lesson>>> lessonsMaps;
  final int selectedWeek;

  @override
  List<Object> get props => [lessonsMaps, selectedWeek];
}

class TeacherMainLoaded extends TeacherMainState {
  const TeacherMainLoaded({
    required super.lessonsMaps,
    required super.selectedWeek,
  });
}

class TeacherMainLoading extends TeacherMainState {
  const TeacherMainLoading({
    required super.lessonsMaps,
    required super.selectedWeek,
  });
}

class TeacherMainError extends TeacherMainState {
  const TeacherMainError({
    required this.failure,
    required super.lessonsMaps,
    required super.selectedWeek,
  });

  final Failure failure;
}
