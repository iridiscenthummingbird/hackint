import 'package:dartz/dartz.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/errors/failures.dart';
import '../../../../domain/core/usecase/usecase.dart';
import '../repositories/complete_registration_repository.dart';

@injectable
class CompleteRegistrationUseCase
    implements UseCase<void, CompleteRegistrationParams> {
  final CompleteRegistrationRepositoryI repository;
  CompleteRegistrationUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CompleteRegistrationParams params) async {
    return await repository.completeRegistration(params);
  }
}

class CompleteRegistrationParams {
  final String name;
  final Group group;
  final String studentsId;
  final String userId;

  CompleteRegistrationParams({
    required this.name,
    required this.group,
    required this.studentsId,
    required this.userId,
  });
}
