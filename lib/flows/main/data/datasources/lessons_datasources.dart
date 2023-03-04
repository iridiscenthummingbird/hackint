import 'package:hackint/services/firestore/firestore_lessons.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/errors/failures.dart';
import '../../../complete_registration/domain/entities/group.dart';
import '../../domain/entities/lesson.dart';

abstract class LessonsDataSourceI {
  Future<List<Lesson>> getLessons(Group group);
}

@Injectable(as: LessonsDataSourceI)
class LessonsDataSource implements LessonsDataSourceI {
  LessonsDataSource(this.firestoreLessons);

  final FirestoreLessons firestoreLessons;

  @override
  Future<List<Lesson>> getLessons(Group group) async {
    try {
      final result = await firestoreLessons.getLessons(group);
      return result;
    } catch (exception) {
      throw ServerFailure(message: 'Something went wrong: $exception');
    }
  }
}
