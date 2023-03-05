import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackint/domain/shared_models/api/user_model.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:hackint/flows/main/domain/entities/change_notification.dart';
import 'package:hackint/flows/main/domain/entities/lesson.dart';
import 'package:hackint/flows/teacher/domain/usecases/change_time.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirestoreLessons {
  FirestoreLessons(this.firebaseFirestore)
      : _lessonsCollection = firebaseFirestore.collection('lessons'),
        _notificationsCollection =
            firebaseFirestore.collection('notifications');

  final FirebaseFirestore firebaseFirestore;

  final CollectionReference<Map<String, dynamic>> _lessonsCollection;
  final CollectionReference<Map<String, dynamic>> _notificationsCollection;

  Future<void> changeTime(ChangeTimeParams params) async {
    final lesson = _lessonsCollection.doc(params.lessonId);
    await lesson.update({
      'time': '${params.time.hour}:${params.time.minute}',
    });
    await _notificationsCollection.add({
      'title': params.title,
      'description': params.description,
      'dateTime': Timestamp.fromDate(DateTime.now()),
      'groups': params.groups.map((group) => group.reference).toList(),
    });
  }

  Future<List<Lesson>> getTeachersLessons(UserModel teacher) async {
    final result = await _lessonsCollection
        .where('teacherRef', isEqualTo: teacher.teacherRef!)
        .get();

    return await _getLessons(result);
  }

  Future<List<Lesson>> getLessons(Group group) async {
    final result = await _lessonsCollection
        .where('groups', arrayContains: group.reference)
        .get();

    return _getLessons(result);
  }

  Future<List<Lesson>> _getLessons(
      QuerySnapshot<Map<String, dynamic>> result) async {
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

      final DocumentReference teacherRef = doc.get('teacherRef');
      final String teacherName = (await teacherRef.get()).get('name');

      final List<Group> groups = [];
      for (final ref in doc.get('groups')) {
        final group = await ref.get();
        groups.add(
          Group(
            id: group.id,
            name: group.get('group'),
            reference: group.reference,
          ),
        );
      }

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
          teacherName: teacherName,
          groups: groups,
        ),
      );
    }
    return lessons;
  }

  Future<List<ChangeNotification>> getNotifications(Group group) async {
    final result = await _notificationsCollection
        .where('groups', arrayContains: group.reference)
        .get();

    final List<ChangeNotification> notifications = [];

    for (final doc in result.docs) {
      notifications.add(
        ChangeNotification(
          id: doc.id,
          title: doc.get('title'),
          description: doc.get('description'),
          dateTime: (doc.get('dateTime') as Timestamp).toDate(),
        ),
      );
    }

    return notifications;
  }
}
