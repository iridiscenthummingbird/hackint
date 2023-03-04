import 'package:hackint/flows/complete_registration/data/datasources/complete_registration_datasource.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hackint/flows/complete_registration/domain/repositories/complete_registration_repository.dart';
import 'package:hackint/flows/complete_registration/domain/usecases/complete_registration.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CompleteRegistrationRepositoryI)
class CompleteRegistrationRepository
    implements CompleteRegistrationRepositoryI {
  final CompleteRegistrationDataSourceI dataSource;

  CompleteRegistrationRepository(this.dataSource);

  @override
  Future<Either<Failure, List<Group>>> getGroups() async {
    try {
      final result = await dataSource.getGroups();
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(
        ServerFailure(message: 'Something went wrong: ${exception.message}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> completeRegistration(
      CompleteRegistrationParams params) async {
    try {
      final result = await dataSource.completeRegistration(params);
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(
        ServerFailure(message: 'Something went wrong: ${exception.message}'),
      );
    }
  }
}
