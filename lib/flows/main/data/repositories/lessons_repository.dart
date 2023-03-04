import 'package:hackint/flows/main/data/datasources/lessons_datasources.dart';
import 'package:hackint/flows/main/domain/entities/lesson.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hackint/flows/main/domain/repositories/lessons_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LessonsRepositoryI)
class LessonsRepository implements LessonsRepositoryI {
  final LessonsDataSourceI dataSource;

  LessonsRepository(this.dataSource);

  @override
  Future<Either<Failure, List<Lesson>>> getLessons(Group group) async {
    try {
      final result = await dataSource.getLessons(group);
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(
        ServerFailure(message: 'Something went wrong: ${exception.message}'),
      );
    }
  }
}
