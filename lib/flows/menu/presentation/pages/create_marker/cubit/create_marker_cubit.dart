import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/domain/core/usecase/usecase.dart';
import 'package:hackint/domain/shared_models/api/marker_type.dart';
import 'package:hackint/flows/menu/domain/usecases/get_marker_types.dart';
import 'package:injectable/injectable.dart';

part 'create_marker_state.dart';

@injectable
class CreateMarkerCubit extends Cubit<CreateMarkerState> {
  CreateMarkerCubit(
    this.getMarkerTypes,
  )   : formKey = GlobalKey<FormState>(),
        titleController = TextEditingController(),
        descriptionController = TextEditingController(),
        super(const CategoriesLoading());

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  final GetMarkerTypesUseCase getMarkerTypes;

  Future<void> loadMarkerTypes() async {
    final result = await getMarkerTypes(NoParams());
    result.fold(
      (failure) {
        emit(
          CreateMarkerError(
            selectedType: state.selectedType,
            failure: failure,
          ),
        );
      },
      (markerTypes) async {
        emit(
          CreateMarkerInitial(
            types: markerTypes,
            selectedType: markerTypes.first,
          ),
        );
      },
    );
  }

  void onSelectType(MarkerType type) {
    emit(
      CreateMarkerInitial(
        types: state.types,
        selectedType: type,
      ),
    );
  }
}
