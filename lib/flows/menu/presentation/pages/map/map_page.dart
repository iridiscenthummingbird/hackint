import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackint/flows/menu/presentation/pages/create_marker/create_marker_page.dart';
import 'package:hackint/flows/menu/presentation/pages/map/cubit/map_cubit.dart';
import 'package:hackint/flows/menu/presentation/pages/map/widgets/add_marker_button.dart';
import 'package:hackint/flows/menu/presentation/pages/map/widgets/marker_info_pop_up.dart';
import 'package:hackint/gen/assets.gen.dart';
import 'package:hackint/services/injectible/injectible_init.dart';
import 'package:hackint/widgets/circular_loading.dart';
import 'package:routemaster/routemaster.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  static const String path = '/map';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MapCubit>()..initMapData(),
      child: Builder(builder: (context) {
        final mapCubit = context.read<MapCubit>();

        return BlocListener<MapCubit, MapState>(
          listener: (context, state) {
            if (state is MarkerPressed) {
              showDialog(
                context: context,
                builder: (context) => MarkerInfoPopUp(
                  title: 'FICT KPI',
                  description:
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                  typeColor: const Color(0xffFF8A00),
                  onClosed: () {
                    Routemaster.of(context).pop();
                  },
                ),
                barrierDismissible: false,
              );
              mapCubit.resetMap();
            }
          },
          child: BlocBuilder<MapCubit, MapState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Map'),
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
                          ? mapCubit.toggleMapType(value)
                          : null,
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                body: Builder(
                  builder: (context) {
                    if (state is! Loading) {
                      return Stack(
                        children: [
                          GoogleMap(
                            mapType: state.mapType,
                            initialCameraPosition:
                                MapCubit.initialCameraPosition,
                            onMapCreated: mapCubit.onMapCreated,
                            zoomControlsEnabled: false,
                            markers: state.markers,
                            mapToolbarEnabled: false,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                          ),
                          Positioned(
                            right: 30,
                            bottom: 30,
                            child: AddMarkerButton(
                              onPressed: () async {
                                final markerAdded = await Routemaster.of(context)
                                    .push<bool>(path + CreateMarkerPage.path).result;
                                if (markerAdded ?? false) {
                                  mapCubit.emitLoading();
                                  await mapCubit.loadMapData();
                                }
                              },
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
        );
      }),
    );
  }
}
