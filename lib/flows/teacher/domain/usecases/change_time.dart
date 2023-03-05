import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/core/errors/failures.dart';
import '../../../../domain/core/usecase/usecase.dart';
import '../repositories/teacher_repository.dart';

@injectable
class ChangeTimeUseCase implements UseCase<void, ChangeTimeParams> {
  final TeacherRepositoryI repository;
  ChangeTimeUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(ChangeTimeParams params) async {
    return await repository.changeTime(params);
  }
}

class ChangeTimeParams {
  final String lessonId;
  final List<Group> groups;
  final TimeOfDay time;
  final String title;
  final String description;

  ChangeTimeParams({
    required this.lessonId,
    required this.groups,
    required this.time,
    required this.title,
    required this.description,
  });
}
