part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  const MainState({
    required this.lessonsMaps,
    required this.selectedWeek,
  });

  final List<Map<int, List<Lesson>>> lessonsMaps;
  final int selectedWeek;

  @override
  List<Object> get props => [lessonsMaps, selectedWeek];
}

class MainLoaded extends MainState {
  const MainLoaded({
    required super.lessonsMaps,
    required super.selectedWeek,
  });
}

class MainLoading extends MainState {
  const MainLoading({
    required super.lessonsMaps,
    required super.selectedWeek,
  });
}

class MainError extends MainState {
  const MainError({
    required this.failure,
    required super.lessonsMaps,
    required super.selectedWeek,
  });

  final Failure failure;
}
