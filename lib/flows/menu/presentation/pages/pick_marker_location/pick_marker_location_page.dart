import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackint/flows/menu/presentation/pages/pick_marker_location/cubit/pick_marker_location_cubit.dart';
import 'package:hackint/gen/assets.gen.dart';
import 'package:hackint/services/injectible/injectible_init.dart';
import 'package:hackint/widgets/circular_loading.dart';
import 'package:hackint/widgets/primary_button.dart';
import 'package:routemaster/routemaster.dart';

class PickMarkerLocationPage extends StatelessWidget {
  const PickMarkerLocationPage({
    required this.name,
    required this.description,
    required this.typeId,
    required this.typeIndex,
    super.key,
  });

  static const path = '/pickMarkerLocation';

  final String name;
  final String description;
  final String typeId;
  final int typeIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PickMarkerLocationCubit>()..loadMapData(typeIndex),
      child: BlocListener<PickMarkerLocationCubit, PickMarkerLocationState>(
        listener: (context, state) {
          if (state is MarkerAdded) {
            Routemaster.of(context).pop(true);
          } else if (state is PickLocationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure.message)),
            );
          }
        },
        child: BlocBuilder<PickMarkerLocationCubit, PickMarkerLocationState>(
          builder: (context, state) {
            final pickLocationCubit = context.read<PickMarkerLocationCubit>();

            return Scaffold(
              appBar: AppBar(
                title: const Text('Select marker location'),
                leading: IconButton(
                  onPressed: () => Routemaster.of(context).pop(),
                  icon: SvgPicture.asset(
                    Assets.icons.back.path,
                  ),
                ),
                actions: [
                  Switch(
                    value: state.mapType == MapType.hybrid,
                    onChanged: (value) => state is! Loading
                        ? pickLocationCubit.toggleMapType(value)
                        : null,
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              body: Builder(
                builder: (context) {
                  if (pickLocationCubit.state is! Loading) {
                    return Stack(
                      children: [
                        GoogleMap(
                          mapType: state.mapType,
                          initialCameraPosition:
                              PickMarkerLocationCubit.initialCameraPosition,
                          onMapCreated: pickLocationCubit.onMapCreated,
                          zoomControlsEnabled: false,
                          markers: state.markers,
                          mapToolbarEnabled: false,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          onTap: (position) =>
                              pickLocationCubit.onMapPressed(position),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 30),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: PrimaryButton(
                              title: 'Add point',
                              onPressed: () {
                                pickLocationCubit.addMarkerPoint(
                                  name: name,
                                  description: description,
                                  typeId: typeId,
                                  lat: state.markerPoint!.latitude,
                                  lon: state.markerPoint!.longitude,
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  }
                  return const CircularLoading();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
