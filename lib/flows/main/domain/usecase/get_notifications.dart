import 'package:dartz/dartz.dart';
import 'package:hackint/flows/main/domain/entities/change_notification.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/errors/failures.dart';
import '../../../../domain/core/usecase/usecase.dart';
import '../../../complete_registration/domain/entities/group.dart';
import '../repositories/lessons_repository.dart';

@injectable
class GetNotificationsUseCase
    implements UseCase<List<ChangeNotification>, Group> {
  final LessonsRepositoryI repository;
  GetNotificationsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ChangeNotification>>> call(Group group) async {
    return await repository.getNotifications(group);
  }
}
