part of 'pick_marker_location_cubit.dart';

abstract class PickMarkerLocationState extends Equatable {
  const PickMarkerLocationState({
    this.markers = const <Marker>{},
    this.markerPoint,
    required this.mapType,
  });

  final Set<Marker> markers;
  final MarkerPoint? markerPoint;
  final MapType mapType;

  @override
  List<Object?> get props => [markers, markerPoint, mapType];
}

class Loading extends PickMarkerLocationState {
  const Loading({
    super.markers,
    super.markerPoint,
    required super.mapType,
  });
}

class MapDataLoaded extends PickMarkerLocationState {
  const MapDataLoaded({
    super.markers,
    super.markerPoint,
    required super.mapType,
  });
}