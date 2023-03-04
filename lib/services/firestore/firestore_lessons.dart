import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:hackint/flows/main/domain/entities/lesson.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirestoreLessons {
  FirestoreLessons(this.firebaseFirestore)
      : _lessonsCollection = firebaseFirestore.collection('lessons');

  final FirebaseFirestore firebaseFirestore;

  final CollectionReference<Map<String, dynamic>> _lessonsCollection;

  Future<List<Lesson>> getLessons(Group group) async {
    final result = await _lessonsCollection
        .where('groups', arrayContains: group.reference)
        .get();
    final List<Lesson> lessons = [];
    for (final doc in result.docs) {
      final String timeString = doc.get('time');
      final timeList = timeString.split(':');
      final daysOfWeek = (doc.get('daysOfWeek') as List)
          .map(
            (item) => item as int,
          )
          .toList();

      final DocumentReference markerRef = doc.get('markerRef');
      final marker = await markerRef.get();

      lessons.add(
        Lesson(
          id: doc.id,
          auditory: doc.get('auditory'),
          buildingName: marker.get('name'),
          daysOfWeek: daysOfWeek,
          time: TimeOfDay(
            hour: int.parse(timeList[0]),
            minute: int.parse(timeList[1]),
          ),
          weekType: doc.get('weekType'),
          subjectName: doc.get('subjectName'),
          buildingId: marker.id,
          type: doc.get('type'),
        ),
      );
    }
    return lessons;
  }
}
