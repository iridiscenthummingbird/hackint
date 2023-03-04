import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackint/flows/menu/presentation/pages/map/cubit/map_cubit.dart';
import 'package:hackint/services/injectible/injectible_init.dart';
import 'package:hackint/widgets/circular_loading.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  static const String path = '/map';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MapCubit>()..loadMapData(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Map')),
        body: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            final mapCubit = context.read<MapCubit>();

            if (mapCubit.state is! Loading) {
              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: MapCubit.initialCameraPosition,
                onMapCreated: mapCubit.onMapCreated,
                zoomControlsEnabled: false,
                markers: state.markers,
                mapToolbarEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              );
            }
            return const CircularLoading();
          },
        ),
      ),
    );
  }
}
