import 'package:dartz/dartz.dart';

import '../../../../domain/core/errors/failures.dart';
import '../../../complete_registration/domain/entities/group.dart';
import '../entities/lesson.dart';

abstract class LessonsRepositoryI {
  Future<Either<Failure, List<Lesson>>> getLessons(Group group);
}
