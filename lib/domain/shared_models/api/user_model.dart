import 'dart:convert' as dart_convert;

import 'package:equatable/equatable.dart';

import '../../../flows/complete_registration/domain/entities/group.dart';

String encodeUserToString(UserModel user) =>
    dart_convert.json.encode(user.toJson());

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    this.name,
    required this.email,
    required this.isCompletedRegistration,
    this.studentId,
    this.group,
  });

  final String id;
  final String? email;
  final String? name;
  final bool isCompletedRegistration;
  final String? studentId;
  final Group? group;

  @override
  String toString() {
    return 'User: { '
        'id: $id, '
        'email: $email, '
        '}';
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    bool? isTermsAccepted,
    bool? isCompletedRegistration,
    String? studentId,
    Group? group,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      isCompletedRegistration:
          isCompletedRegistration ?? this.isCompletedRegistration,
      studentId: studentId ?? this.studentId,
      group: group ?? this.group,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) throw (Exception('user_from_json_error'));

    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      isCompletedRegistration: json['isCompleteRegistration'],
      studentId: json['studentId'],
      group: json['group'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [id, email, name];
}
