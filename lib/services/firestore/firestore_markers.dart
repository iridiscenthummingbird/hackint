import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackint/flows/menu/data/models/marker_point_model.dart';
import 'package:hackint/domain/shared_models/api/marker_type.dart';
import 'package:hackint/flows/menu/presentation/pages/map/enums/markers_icons.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirestoreMarkers {
  FirestoreMarkers(this.firebaseFirestore)
      : _markersCollection = firebaseFirestore.collection('markers');

  final FirebaseFirestore firebaseFirestore;

  final CollectionReference<Map<String, dynamic>> _markersCollection;

  Future<List<MarkerPointModel>> getMarkerPoints() async {
    final result = await _markersCollection.get();
    final List<MarkerPointModel> markerPoints = [];
    for (final doc in result.docs) {
      final DocumentReference markerTypeRef = doc.get('typeRef');
      final markerTypeDoc = await markerTypeRef.get();
      final MarkerType markerType = MarkerType(
        id: markerTypeDoc.id,
        name: markerTypeDoc.get('name'),
        color: Color(
          markerTypeDoc.get('color'),
        ),
        icon: MarkersIconsMapper.toEnum(
          markerTypeDoc.get('markerIcon'),
        ),
      );

      markerPoints.add(
        MarkerPointModel(
          id: doc.id,
          name: doc.get('name'),
          description: doc.get('description'),
          type: markerType,
          latitude: doc.get('lat'),
          longitude: doc.get('lon'),
        ),
      );
    }

    return markerPoints;
  }
}
