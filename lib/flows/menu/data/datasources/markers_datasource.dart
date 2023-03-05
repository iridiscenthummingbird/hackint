import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/flows/menu/data/models/marker_point_model.dart';
import 'package:hackint/services/firestore/firestore_markers.dart';
import 'package:injectable/injectable.dart';

abstract class MarkersDataSourceI {
  Future<List<MarkerPointModel>> getMarkerPoints();
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
}
