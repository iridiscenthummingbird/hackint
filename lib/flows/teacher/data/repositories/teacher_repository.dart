import 'package:hackint/flows/main/domain/entities/lesson.dart';
import 'package:hackint/domain/shared_models/api/user_model.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hackint/flows/teacher/domain/repositories/teacher_repository.dart';
import 'package:hackint/flows/teacher/domain/usecases/change_time.dart';
import 'package:injectable/injectable.dart';

import '../datasources/teacher_datasource.dart';

@Injectable(as: TeacherRepositoryI)
class TeacherRepository implements TeacherRepositoryI {
  final TeacherDataSourceI dataSource;

  TeacherRepository(this.dataSource);

  @override
  Future<Either<Failure, List<Lesson>>> getLessons(UserModel teacher) async {
    try {
      final result = await dataSource.getLessons(teacher);
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(
        ServerFailure(message: 'Something went wrong: ${exception.message}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> changeTime(ChangeTimeParams params) async {
    try {
      final result = await dataSource.changeTime(params);
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(
        ServerFailure(message: 'Something went wrong: ${exception.message}'),
      );
    }
  }
}
