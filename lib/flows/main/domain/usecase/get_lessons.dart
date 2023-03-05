import 'package:dartz/dartz.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:hackint/flows/main/domain/entities/lesson.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/errors/failures.dart';
import '../../../../domain/core/usecase/usecase.dart';
import '../repositories/lessons_repository.dart';

@injectable
class GetLessonsUseCase implements UseCase<List<Lesson>, Group> {
  final LessonsRepositoryI repository;
  GetLessonsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Lesson>>> call(Group group) async {
    return await repository.getLessons(group);
  }
}
