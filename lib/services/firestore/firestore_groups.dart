import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirestoreGroups {
  FirestoreGroups(this.firebaseFirestore)
      : _groupsCollection = firebaseFirestore.collection('groups');

  final FirebaseFirestore firebaseFirestore;

  final CollectionReference<Map<String, dynamic>> _groupsCollection;

  Future<List<Group>> getGroups() async {
    final result = await _groupsCollection.get();
    final List<Group> groups = [];
    for (final doc in result.docs) {
      groups.add(
        Group(
          id: doc.id,
          name: doc.get('group'),
          reference: doc.reference,
        ),
      );
    }
    return groups;
  }
}
