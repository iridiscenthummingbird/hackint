import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/domain/core/usecase/usecase.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:hackint/flows/complete_registration/domain/usecases/complete_registration.dart';
import 'package:hackint/flows/complete_registration/domain/usecases/get_groups.dart';
import 'package:injectable/injectable.dart';

part 'complete_registration_state.dart';

@injectable
class CompleteRegistrationCubit extends Cubit<CompleteRegistrationState> {
  CompleteRegistrationCubit(
    this.getGroupsUseCase,
    this.completeRegistrationUseCase,
  ) : super(const CompleteRegistrationLoading(
          groups: [],
          choosedGroup: null,
        ));
  final GetGroupsUseCase getGroupsUseCase;
  final CompleteRegistrationUseCase completeRegistrationUseCase;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final studentsIdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> getGroups() async {
    final res = await getGroupsUseCase(NoParams());
    res.fold(
      (failure) {
        emit(
          CompleteRegistrationError(
            groups: state.groups,
            choosedGroup: state.choosedGroup,
            failure: failure,
          ),
        );
      },
      (groups) {
        emit(
          CompleteRegistrationLoaded(
            groups: groups,
            choosedGroup: state.choosedGroup,
          ),
        );
      },
    );
  }

  void chooseGroup(Group? group) {
    emit(
      CompleteRegistrationLoaded(
        groups: state.groups,
        choosedGroup: group,
      ),
    );
  }

  Future<void> completeRegistration(String userId) async {
    final String name =
        '${firstNameController.text} ${lastNameController.text}';
    final result = await completeRegistrationUseCase(
      CompleteRegistrationParams(
        name: name,
        group: state.choosedGroup!,
        studentsId: studentsIdController.text,
        userId: userId,
      ),
    );
    result.fold(
      (failure) {
        emit(
          CompleteRegistrationError(
            groups: state.groups,
            choosedGroup: state.choosedGroup,
            failure: failure,
          ),
        );
      },
      (_) {
        emit(
          Completed(
            groups: state.groups,
            choosedGroup: state.choosedGroup,
          ),
        );
      },
    );
  }
}
