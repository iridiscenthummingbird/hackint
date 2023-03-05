import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/domain/core/usecase/usecase.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_point.dart';
import 'package:hackint/flows/menu/domain/usecases/get_marker_points.dart';
import 'package:hackint/flows/menu/presentation/pages/map/enums/markers_icons.dart';
import 'package:hackint/flows/menu/presentation/pages/map/helpers/location_permissions_helper.dart';
import 'package:hackint/flows/menu/presentation/pages/map/helpers/marker_helper.dart';
import 'package:injectable/injectable.dart';

part 'map_state.dart';

@injectable
class MapCubit extends Cubit<MapState> {
  MapCubit(
    this.getMarkerPointsUseCase,
  ) : super(
          const Loading(
            mapType: MapType.normal,
          ),
        );

  late GoogleMapController controller;
  late Map<MarkersIcons, Uint8List> markersIcons;

  final GetMarkerPointsUseCase getMarkerPointsUseCase;

  static const CameraPosition defaultInitialCameraPosition = CameraPosition(
    target: LatLng(50.448899667450405, 30.456975575830512),
    zoom: 15,
  );

  Future<void> initMapData(String focusedPlaceId) async {
    markersIcons =
        await MarkerHelper.initMarkersIcons(state.mapType == MapType.normal);
    await LocationPermissionsHelper.requestLocationPermissions();
    await loadMapData(focusedPlaceId);
  }

  Future<void> loadMapData([String? focusedPlaceId]) async {
    final result = await getMarkerPointsUseCase(NoParams());
    result.fold(
      (failure) {
        emit(
          MapError(
            markers: state.markers,
            markerPoints: state.markerPoints,
            mapType: state.mapType,
            failure: failure,
          ),
        );
      },
      (markerPoints) async {
        CameraPosition? initialCameraPosition;
        if (focusedPlaceId != null && focusedPlaceId.isNotEmpty) {
          final markerPoint =
              markerPoints.firstWhereOrNull((m) => m.id == focusedPlaceId);
          if (markerPoint != null) {
            final lat = markerPoint.latitude;
            final lon = markerPoint.longitude;
            initialCameraPosition = CameraPosition(
              target: LatLng(lat, lon),
              zoom: 16,
            );
          }
        }
        await displayMarkers(
          markerPoints,
          initialCameraPosition: initialCameraPosition,
        );
      },
    );
  }

  Future<void> displayMarkers(List<MarkerPoint> markerPoints,
      {MapType? mapType, CameraPosition? initialCameraPosition}) async {
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
        initialCameraPosition:
            initialCameraPosition ?? defaultInitialCameraPosition,
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
    final pressedMarkerPoint =
        state.markerPoints.firstWhereOrNull((m) => m.id == id);

    if (pressedMarkerPoint != null) {
      emit(
        MarkerPressed(
          markers: state.markers,
          markerPoints: state.markerPoints,
          mapType: state.mapType,
          pressedMarkerPoint: pressedMarkerPoint,
        ),
      );
    } else {
      emit(
        MapError(
          markers: state.markers,
          markerPoints: state.markerPoints,
          mapType: state.mapType,
          failure: const OtherFailure(
            message: 'ERROR: Could not find info about the place',
          ),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    controller.dispose();
    super.close();
  }
}
