part of 'create_marker_cubit.dart';

class CreateMarkerState extends Equatable {
  const CreateMarkerState({
    this.typeId,
  });

  final String? typeId;

  @override
  List<Object?> get props => [typeId];
}

class CategoriesLoading extends CreateMarkerState {
  const CategoriesLoading({
    super.typeId,
  });
}

class CreateMarkerInitial extends CreateMarkerState {
  const CreateMarkerInitial({
    super.typeId,
  });
}
