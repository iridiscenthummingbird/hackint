import 'package:dartz/dartz.dart';
import 'package:hackint/domain/shared_models/api/user_model.dart';

import '../../../../domain/core/errors/failures.dart';
import '../../../main/domain/entities/lesson.dart';
import '../usecases/change_time.dart';

abstract class TeacherRepositoryI {
  Future<Either<Failure, List<Lesson>>> getLessons(UserModel teacher);
  Future<Either<Failure, void>> changeTime(ChangeTimeParams params);
}
