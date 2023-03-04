import 'package:hackint/services/firestore/firestore_groups.dart';
import 'package:hackint/services/firestore/firestore_users.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/errors/failures.dart';
import '../../domain/entities/group.dart';
import '../../domain/usecases/complete_registration.dart';

abstract class CompleteRegistrationDataSourceI {
  Future<List<Group>> getGroups();
  Future<void> completeRegistration(CompleteRegistrationParams params);
}

@Injectable(as: CompleteRegistrationDataSourceI)
class CompleteRegistrationDataSource
    implements CompleteRegistrationDataSourceI {
  CompleteRegistrationDataSource(
    this.firestoreGroups,
    this.firestoreUsers,
  );
  final FirestoreGroups firestoreGroups;
  final FirestoreUsers firestoreUsers;

  @override
  Future<List<Group>> getGroups() async {
    try {
      final result = await firestoreGroups.getGroups();
      return result;
    } catch (exception) {
      throw ServerFailure(message: 'Something went wrong: $exception');
    }
  }

  @override
  Future<void> completeRegistration(CompleteRegistrationParams params) async {
    try {
      return await firestoreUsers.completeRegistration(params);
    } catch (exception) {
      throw ServerFailure(message: 'Something went wrong: $exception');
    }
  }
}
