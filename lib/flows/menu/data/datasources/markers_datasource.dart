import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/domain/shared_models/api/marker_type.dart';
import 'package:hackint/flows/menu/data/models/marker_point_model.dart';
import 'package:hackint/services/firestore/firestore_markers.dart';
import 'package:injectable/injectable.dart';

abstract class MarkersDataSourceI {
  Future<List<MarkerPointModel>> getMarkerPoints();
  Future<List<MarkerType>> getMarkerTypes();
  Future<void> addMarkerPoint({
    required String name,
    required String description,
    required String typeId,
    required double lat,
    required double lon,
  });
}

@Injectable(as: MarkersDataSourceI)
class MarkersDataSourceImpl implements MarkersDataSourceI {
  MarkersDataSourceImpl(
    this.firestoreMarkers,
  );

  final FirestoreMarkers firestoreMarkers;

  @override
  Future<List<MarkerPointModel>> getMarkerPoints() async {
    try {
      final result = await firestoreMarkers.getMarkerPoints();
      return result;
    } catch (exception) {
      throw ServerFailure(message: 'Something went wrong: $exception');
    }
  }

  @override
  Future<List<MarkerType>> getMarkerTypes() async {
    try {
      final result = await firestoreMarkers.getMarkerTypes();
      return result;
    } catch (exception) {
      throw ServerFailure(message: 'Something went wrong: $exception');
    }
  }

  @override
  Future<void> addMarkerPoint({
    required String name,
    required String description,
    required String typeId,
    required double lat,
    required double lon,
  }) async {
    try {
      final result = await firestoreMarkers.addMarkerPoint(
        name: name,
        description: description,
        typeId: typeId,
        lat: lat,
        lon: lon,
      );
      return result;
    } catch (exception) {
      throw ServerFailure(message: 'Something went wrong: $exception');
    }
  }
}
