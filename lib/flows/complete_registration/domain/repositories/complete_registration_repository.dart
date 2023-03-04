import 'package:dartz/dartz.dart';
import 'package:hackint/flows/complete_registration/domain/usecases/complete_registration.dart';

import '../../../../domain/core/errors/failures.dart';
import '../entities/group.dart';

abstract class CompleteRegistrationRepositoryI {
  Future<Either<Failure, List<Group>>> getGroups();
  Future<Either<Failure, void>> completeRegistration(
      CompleteRegistrationParams params);
}
