part of 'complete_registration_cubit.dart';

abstract class CompleteRegistrationState extends Equatable {
  const CompleteRegistrationState({
    required this.groups,
    required this.choosedGroup,
  });

  final List<Group> groups;
  final Group? choosedGroup;

  @override
  List<Object?> get props => [groups, choosedGroup];
}

class CompleteRegistrationLoading extends CompleteRegistrationState {
  const CompleteRegistrationLoading({
    required super.groups,
    required super.choosedGroup,
  });
}

class CompleteRegistrationLoaded extends CompleteRegistrationState {
  const CompleteRegistrationLoaded({
    required super.groups,
    required super.choosedGroup,
  });
}

class CompleteRegistrationError extends CompleteRegistrationState {
  const CompleteRegistrationError({
    required super.groups,
    required super.choosedGroup,
    required this.failure,
  });

  final Failure failure;
}

class Completed extends CompleteRegistrationState {
  const Completed({
    required super.groups,
    required super.choosedGroup,
  });
}
