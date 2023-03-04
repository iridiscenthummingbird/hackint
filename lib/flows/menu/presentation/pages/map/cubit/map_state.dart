part of 'map_cubit.dart';

abstract class MapState extends Equatable {
  const MapState({
    this.markers = const <Marker>{},
  });

  final Set<Marker> markers;

  @override
  List<Object> get props => [markers];
}

class Loading extends MapState {
  const Loading({
    super.markers,
  });
}

class MapDataLoaded extends MapState {
  const MapDataLoaded({
    super.markers,
  });
}
