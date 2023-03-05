part of 'map_cubit.dart';

abstract class MapState extends Equatable {
  const MapState({
    this.markers = const <Marker>{},
    this.markerPoints = const [],
    required this.mapType,
  });

  final Set<Marker> markers;
  final List<MarkerPoint> markerPoints;
  final MapType mapType;

  @override
  List<Object> get props => [markers, markerPoints, mapType];
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
    required super.mapType,
  });
}

class MarkerPressed extends MapDataLoaded {
  const MarkerPressed({
    super.markers,
    super.markerPoints,
    required super.mapType,
    required this.markerId,
  });

  final String markerId;
}
