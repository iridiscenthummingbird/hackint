import 'package:dartz/dartz.dart';
import 'package:hackint/domain/shared_models/api/user_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/errors/failures.dart';
import '../../../../domain/core/usecase/usecase.dart';
import '../../../main/domain/entities/lesson.dart';
import '../repositories/teacher_repository.dart';

@injectable
class GetTeachersLessonsUseCase implements UseCase<List<Lesson>, UserModel> {
  final TeacherRepositoryI repository;
  GetTeachersLessonsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Lesson>>> call(UserModel teacher) async {
    return await repository.getLessons(teacher);
  }
}
