import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_point.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_type.dart';
import 'package:hackint/flows/menu/presentation/pages/map/enums/markers_icons.dart';
import 'package:hackint/flows/menu/presentation/pages/map/helpers/location_permissions_helper.dart';
import 'package:hackint/flows/menu/presentation/pages/map/helpers/marker_helper.dart';
import 'package:injectable/injectable.dart';

part 'map_state.dart';

@injectable
class MapCubit extends Cubit<MapState> {
  MapCubit()
      : super(
          const Loading(
            mapType: MapType.normal,
          ),
        );

  late GoogleMapController controller;
  late Map<MarkersIcons, Uint8List> markersIcons;

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(50.448899667450405, 30.456975575830512),
    zoom: 15,
  );
  final List<MarkerPoint> mockedMarkers = const [
    MarkerPoint(
      id: '1',
      name: 'Marker one',
      type: MarkerType(
        id: '1',
        name: 'Shop',
        color: Colors.red,
        icon: MarkersIcons.defaultMarker,
      ),
      latitude: 50.448899667450405,
      longitude: 30.456975575830512,
    ),
    MarkerPoint(
      id: '2',
      name: 'Marker two',
      type: MarkerType(
        id: '2',
        name: 'Shop',
        color: Colors.red,
        icon: MarkersIcons.defaultMarker,
      ),
      latitude: 50.4474248217571,
      longitude: 30.453838804731927,
    ),
  ];

  Future<void> initMapData() async {
    markersIcons =
        await MarkerHelper.initMarkersIcons(state.mapType == MapType.normal);
    await LocationPermissionsHelper.requestLocationPermissions();
    await loadMapData();
  }

  Future<void> loadMapData() async {
    // TODO: load map data from db
    await Future.delayed(const Duration(seconds: 2));
    await displayMarkers(mockedMarkers);
  }

  Future<void> displayMarkers(List<MarkerPoint> markerPoints,
      {MapType? mapType}) async {
    final markers = markerPoints
        .map(
          (m) => Marker(
            markerId: MarkerId(m.id),
            position: LatLng(m.latitude, m.longitude),
            icon: BitmapDescriptor.fromBytes(markersIcons[m.type.icon]!),
            onTap: () => _onMarkerPressed(m.id),
          ),
        )
        .toSet();

    emit(
      MapDataLoaded(
        markers: markers,
        markerPoints: markerPoints,
        mapType: mapType ?? state.mapType,
      ),
    );
  }

  Future<void> toggleMapType(bool value) async {
    markersIcons = await MarkerHelper.initMarkersIcons(value == false);
    await displayMarkers(
      state.markerPoints,
      mapType: value ? MapType.hybrid : MapType.normal,
    );
  }

  void resetMap() => emit(
        MapDataLoaded(
          markers: state.markers,
          markerPoints: state.markerPoints,
          mapType: state.mapType,
        ),
      );

  void emitLoading() => emit(
        Loading(
          markers: state.markers,
          markerPoints: state.markerPoints,
          mapType: state.mapType,
        ),
      );

  void onMapCreated(GoogleMapController mapController) {
    controller = mapController;
  }

  void _onMarkerPressed(String id) {
    emit(
      MarkerPressed(
        markers: state.markers,
        markerPoints: state.markerPoints,
        mapType: state.mapType,
        markerId: id,
      ),
    );
  }

  @override
  Future<void> close() async {
    controller.dispose();
    super.close();
  }
}
