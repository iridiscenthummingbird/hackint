import 'package:flutter/material.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';

class Lesson {
  final String id;
  final String auditory;
  final String buildingName;
  final List<int> daysOfWeek;
  final TimeOfDay time;
  final int weekType;
  final String subjectName;
  final String buildingId;
  final String type;
  final String teacherName;
  final List<Group> groups;

  Lesson({
    required this.id,
    required this.auditory,
    required this.buildingName,
    required this.daysOfWeek,
    required this.time,
    required this.weekType,
    required this.subjectName,
    required this.buildingId,
    required this.type,
    required this.teacherName,
    required this.groups,
  });
}
