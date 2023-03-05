import 'package:injectable/injectable.dart';

import '../../../../domain/core/errors/failures.dart';
import '../../../../domain/shared_models/api/user_model.dart';
import '../../../../services/firestore/firestore_lessons.dart';
import '../../../main/domain/entities/lesson.dart';
import '../../domain/usecases/change_time.dart';

abstract class TeacherDataSourceI {
  Future<List<Lesson>> getLessons(UserModel teacher);
  Future<void> changeTime(ChangeTimeParams params);
}

@Injectable(as: TeacherDataSourceI)
class TeacherDataSource implements TeacherDataSourceI {
  TeacherDataSource(this.firestoreLessons);

  final FirestoreLessons firestoreLessons;

  @override
  Future<List<Lesson>> getLessons(UserModel teacher) async {
    try {
      final result = await firestoreLessons.getTeachersLessons(teacher);
      return result;
    } catch (exception) {
      throw ServerFailure(message: 'Something went wrong: $exception');
    }
  }

  @override
  Future<void> changeTime(ChangeTimeParams params) async {
    try {
      return await firestoreLessons.changeTime(params);
    } catch (exception) {
      throw ServerFailure(message: 'Something went wrong: $exception');
    }
  }
}
