import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_point.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_type.dart';
import 'package:hackint/flows/menu/presentation/pages/map/enums/markers_icons.dart';
import 'package:hackint/flows/menu/presentation/pages/map/helpers/marker_helper.dart';
import 'package:injectable/injectable.dart';

part 'pick_marker_location_state.dart';

@injectable
class PickMarkerLocationCubit extends Cubit<PickMarkerLocationState> {
  PickMarkerLocationCubit()
      : super(
          const Loading(mapType: MapType.normal),
        );

  late GoogleMapController controller;
  late Map<MarkersIcons, Uint8List> markersIcons;

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(50.448899667450405, 30.456975575830512),
    zoom: 15,
  );

  Future<void> loadMapData() async {
    markersIcons =
        await MarkerHelper.initMarkersIcons(state.mapType == MapType.normal);
    final MarkerPoint markerPoint = MarkerPoint(
      name: 'Marker one',
      type: const MarkerType(
        id: '1',
        name: 'Shop',
        color: Colors.red,
        icon: MarkersIcons.defaultMarker,
      ),
      latitude: initialCameraPosition.target.latitude,
      longitude: initialCameraPosition.target.longitude,
    );
    await displayMarker(markerPoint);
  }

  Future<void> displayMarker(
    MarkerPoint markerPoint, {
    MapType? mapType,
  }) async {
    final markers = {
      Marker(
        markerId: const MarkerId('pickLocationMarker'),
        position: LatLng(markerPoint.latitude, markerPoint.longitude),
        icon: BitmapDescriptor.fromBytes(markersIcons[markerPoint.type.icon]!),
      ),
    };

    emit(
      MapDataLoaded(
        markers: markers,
        markerPoint: markerPoint,
        mapType: mapType ?? state.mapType,
      ),
    );
  }

  void onMapPressed(LatLng position) {
    final lat = position.latitude;
    final lon = position.longitude;

    emit(
      MapDataLoaded(
        markers: {state.markers.first.copyWith(positionParam: position)},
        markerPoint: state.markerPoint?.copyWith(
          latitude: lat,
          longitude: lon,
        ),
        mapType: state.mapType,
      ),
    );
  }

  Future<void> toggleMapType(bool value) async {
    markersIcons = await MarkerHelper.initMarkersIcons(value == false);
    await displayMarker(
      state.markerPoint!,
      mapType: value ? MapType.hybrid : MapType.normal,
    );
  }

  void onMapCreated(GoogleMapController mapController) {
    controller = mapController;
  }
}
