import 'package:dartz/dartz.dart';
import 'package:hackint/domain/core/usecase/usecase.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:hackint/flows/complete_registration/domain/repositories/complete_registration_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/errors/failures.dart';

@injectable
class GetGroupsUseCase implements UseCase<List<Group>, NoParams> {
  final CompleteRegistrationRepositoryI repository;
  GetGroupsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Group>>> call(NoParams noParams) async {
    return await repository.getGroups();
  }
}
