import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackint/domain/shared_models/api/marker_type.dart';
import 'package:hackint/flows/menu/presentation/pages/create_marker/cubit/create_marker_cubit.dart';
import 'package:hackint/flows/menu/presentation/pages/create_marker/widgets/app_text_field.dart';
import 'package:hackint/flows/menu/presentation/pages/create_marker/widgets/category_item.dart';
import 'package:hackint/flows/menu/presentation/pages/map/enums/markers_icons.dart';
import 'package:hackint/flows/menu/presentation/pages/pick_marker_location/pick_marker_location_page.dart';
import 'package:hackint/gen/assets.gen.dart';
import 'package:hackint/services/injectible/injectible_init.dart';
import 'package:hackint/widgets/primary_button.dart';
import 'package:routemaster/routemaster.dart';

class CreateMarkerPage extends StatelessWidget {
  const CreateMarkerPage({super.key});

  static const path = '/createMarker';

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();

    return BlocProvider(
      create: (context) => getIt<CreateMarkerCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create marker'),
          leading: IconButton(
            onPressed: () => Routemaster.of(context).pop(),
            icon: SvgPicture.asset(
              Assets.icons.back.path,
            ),
          ),
          titleSpacing: 0,
          leadingWidth: 52,
        ),
        body: GestureDetector(
          onTap: () {
            if (focusNode.hasFocus) {
              focusNode.unfocus();
            }
          },
          behavior: HitTestBehavior.opaque,
          child: BlocBuilder<CreateMarkerCubit, CreateMarkerState>(
            builder: (context, state) {
              final createMarkerCubit = context.read<CreateMarkerCubit>();

              return CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                      child: Form(
                        key: createMarkerCubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextField(
                              title: 'Place name',
                              controller: createMarkerCubit.titleController,
                              validator: (input) {
                                if (input?.isEmpty ?? true) {
                                  return 'The filed should not be empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            AppTextField(
                              title: 'Description',
                              controller:
                                  createMarkerCubit.descriptionController,
                              validator: (input) {
                                if (input?.isEmpty ?? true) {
                                  return 'The filed should not be empty';
                                }
                                return null;
                              },
                              focusNode: focusNode,
                              maxLength: 200,
                              maxLines: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 12),
                              child: Text(
                                'Choose category',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                CategoryItem(
                                  markerType: const MarkerType(
                                    id: '1',
                                    name: 'Hostel',
                                    color: Colors.red,
                                    icon: MarkersIcons.shop,
                                  ),
                                  isSelected: true,
                                  onPressed: () {},
                                ),
                                CategoryItem(
                                  markerType: const MarkerType(
                                    id: '2',
                                    name: 'Shop',
                                    color: Colors.red,
                                    icon: MarkersIcons.shop,
                                  ),
                                  isSelected: false,
                                  onPressed: () {},
                                ),
                                CategoryItem(
                                  markerType: const MarkerType(
                                    id: '3',
                                    name: 'Educational',
                                    color: Colors.red,
                                    icon: MarkersIcons.shop,
                                  ),
                                  isSelected: false,
                                  onPressed: () {},
                                ),
                                CategoryItem(
                                  markerType: const MarkerType(
                                    id: '4',
                                    name: 'Playground',
                                    color: Colors.red,
                                    icon: MarkersIcons.shop,
                                  ),
                                  isSelected: false,
                                  onPressed: () {},
                                ),
                                CategoryItem(
                                  markerType: const MarkerType(
                                    id: '5',
                                    name: 'Polyana',
                                    color: Colors.red,
                                    icon: MarkersIcons.shop,
                                  ),
                                  isSelected: false,
                                  onPressed: () {},
                                )
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 84, top: 10),
                              child: PrimaryButton(
                                title: 'Create marker',
                                onPressed: () async {
                                  final routemaster = Routemaster.of(context);
                                  final formState =
                                      createMarkerCubit.formKey.currentState;
                                  if (formState?.validate() ?? false) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    final markerAdded = await routemaster
                                        .push<bool>(
                                          routemaster.currentRoute.path +
                                              PickMarkerLocationPage.path,
                                        )
                                        .result;
                                    if (markerAdded ?? false) {
                                      routemaster.pop(true);
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
