import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_type.dart';
import 'package:injectable/injectable.dart';

part 'create_marker_state.dart';

@injectable
class CreateMarkerCubit extends Cubit<CreateMarkerState> {
  CreateMarkerCubit()
      : formKey = GlobalKey<FormState>(),
        titleController = TextEditingController(),
        descriptionController = TextEditingController(),
        super(const CategoriesLoading());

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
}
