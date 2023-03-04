import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final String id;
  final String name;
  final DocumentReference reference;

  const Group({
    required this.id,
    required this.name,
    required this.reference,
  });

  @override
  List<Object?> get props => [id, name];
}
