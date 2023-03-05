part of 'create_marker_cubit.dart';

class CreateMarkerState extends Equatable {
  const CreateMarkerState({
    this.types = const [],
    this.selectedType,
  });

  final List<MarkerType> types;
  final MarkerType? selectedType;

  @override
  List<Object?> get props => [types, selectedType];
}

class CategoriesLoading extends CreateMarkerState {
  const CategoriesLoading({
    super.types,
    super.selectedType,
  });
}

class CreateMarkerInitial extends CreateMarkerState {
  const CreateMarkerInitial({
    super.types,
    super.selectedType,
  });
}

class CreateMarkerError extends CreateMarkerState {
  const CreateMarkerError({
    super.types,
    super.selectedType,
    required this.failure,
  });

  final Failure failure;
}
