import 'package:dartz/dartz.dart';
import 'package:hackint/flows/main/domain/entities/change_notification.dart';

import '../../../../domain/core/errors/failures.dart';
import '../../../complete_registration/domain/entities/group.dart';
import '../entities/lesson.dart';

abstract class LessonsRepositoryI {
  Future<Either<Failure, List<Lesson>>> getLessons(Group group);
  Future<Either<Failure, List<ChangeNotification>>> getNotifications(
      Group group);
}
