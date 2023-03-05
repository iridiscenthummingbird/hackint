part of 'map_cubit.dart';

abstract class MapState extends Equatable {
  const MapState({
    this.markers = const <Marker>{},
    this.markerPoints = const [],
    this.initialCameraPosition = MapCubit.defaultInitialCameraPosition,
    required this.mapType,
  });

  final Set<Marker> markers;
  final List<MarkerPoint> markerPoints;
  final CameraPosition initialCameraPosition;
  final MapType mapType;

  @override
  List<Object> get props => [
        markers,
        markerPoints,
        mapType,
        initialCameraPosition,
      ];
}

class Loading extends MapState {
  const Loading({
    super.markers,
    super.markerPoints,
    required super.mapType,
  });
}

class MapDataLoaded extends MapState {
  const MapDataLoaded({
    super.markers,
    super.markerPoints,
    super.initialCameraPosition,
    required super.mapType,
  });
}

class MarkerPressed extends MapDataLoaded {
  const MarkerPressed({
    super.markers,
    super.markerPoints,
    required super.mapType,
    required this.pressedMarkerPoint,
  });

  final MarkerPoint pressedMarkerPoint;
}

class MapError extends MapDataLoaded {
  const MapError({
    super.markers,
    super.markerPoints,
    required super.mapType,
    required this.failure,
  });

  final Failure failure;
}
