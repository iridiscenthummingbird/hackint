import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_point.dart';
import 'package:hackint/flows/menu/presentation/pages/map/enums/markers_icons.dart';
import 'package:hackint/flows/menu/presentation/pages/map/helpers/location_permissions_helper.dart';
import 'package:hackint/flows/menu/presentation/pages/map/helpers/marker_helper.dart';
import 'package:injectable/injectable.dart';

part 'map_state.dart';

@injectable
class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const Loading());

  late GoogleMapController controller;
  late final Map<MarkersIcons, Uint8List> markersIcons;
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(50.448899667450405, 30.456975575830512),
    zoom: 14.7,
  );

  static const List<MarkerPoint> mockedMarkers = [
    MarkerPoint(
      id: '1',
      name: 'Marker one',
      type: 'Type',
      latitude: 50.448899667450405,
      longitude: 30.456975575830512,
    ),
    MarkerPoint(
      id: '2',
      name: 'Marker two',
      type: 'Type',
      latitude: 50.44752572886886,
      longitude: 30.453540532255243,
    ),
  ];

  Future<void> loadMapData() async {
    markersIcons = await MarkerHelper.initMarkersIcons();
    await LocationPermissionsHelper.requestLocationPermissions();
    await displayMarkers(mockedMarkers);
  }

  Future<void> displayMarkers(List<MarkerPoint> mapMarkers) async {
    final markers = mapMarkers
        .map(
          (m) => Marker(
            markerId: MarkerId(m.id),
            position: LatLng(m.latitude, m.longitude),
            icon: BitmapDescriptor.fromBytes(
                markersIcons[MarkersIcons.defaultMarker]!),
            onTap: () => _onMarkerPressed,
          ),
        )
        .toSet();

    emit(
      MapDataLoaded(markers: markers),
    );
  }

  void onMapCreated(GoogleMapController mapController) {
    controller = mapController;
  }

  void _onMarkerPressed(String id) async {
    print('markerId: $id');
  }

  @override
  Future<void> close() async {
    controller.dispose();
    super.close();
  }
}
