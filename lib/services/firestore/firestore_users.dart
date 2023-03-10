import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackint/domain/shared_models/api/user_model.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:injectable/injectable.dart';

import '../../flows/complete_registration/domain/usecases/complete_registration.dart';

@injectable
class FirestoreUsers {
  FirestoreUsers(this.firebaseFirestore)
      : _usersCollection = firebaseFirestore.collection('users'),
        _teachersCollection = firebaseFirestore.collection('teachers');

  final FirebaseFirestore firebaseFirestore;

  final CollectionReference<Map<String, dynamic>> _usersCollection;
  final CollectionReference<Map<String, dynamic>> _teachersCollection;

  Future<bool> checkUserExists(String email) async {
    final result = await _usersCollection
        .where(
          'email',
          isEqualTo: email,
        )
        .get();
    return result.docs.isNotEmpty;
  }

  Future<void> addUser(String email) async {
    await _usersCollection.add({
      'email': email,
      'isCompleteRegistration': false,
    });
  }

  Future<UserModel> getUserByEmail(String email) async {
    final result =
        await _usersCollection.where('email', isEqualTo: email).get();
    if (result.docs.isEmpty) {
      final teacherResult =
          await _teachersCollection.where('email', isEqualTo: email).get();
      if (teacherResult.docs.isEmpty) {
        throw 'No user with this email';
      }
      final teacher = teacherResult.docs.first;

      return UserModel(
        id: teacher.id,
        email: email,
        name: teacher.get('name'),
        isStudent: false,
        isCompletedRegistration: true,
        teacherRef: teacher.reference,
        isAdmin: teacher.get('isAdmin'),
      );
    }
    final user = result.docs.first;
    final userData = user.data();
    Group? group;
    if (userData['group'] != null) {
      DocumentReference groupRef = userData['group'];
      final groupDoc = await groupRef.get();
      group = Group(
        id: groupDoc.id,
        name: groupDoc.get('group'),
        reference: groupRef,
      );
    }

    return UserModel(
      id: user.id,
      email: userData['email'],
      isCompletedRegistration: userData['isCompleteRegistration'],
      studentId: userData['studentsId'],
      name: userData['name'],
      group: group,
      isStudent: true,
    );
  }

  Future<void> completeRegistration(CompleteRegistrationParams params) async {
    final user = await _usersCollection.doc(params.userId).get();
    user.reference.update({
      'isCompleteRegistration': true,
      'group': params.group.reference,
      'name': params.name,
      'studentsId': params.studentsId,
    });
  }
}
