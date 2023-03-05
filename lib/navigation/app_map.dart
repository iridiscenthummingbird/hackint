import 'package:flutter/material.dart';
import 'package:hackint/domain/shared_models/api/user_model.dart';
import 'package:hackint/flows/menu/presentation/pages/profile/profile.dart';
import 'package:hackint/flows/menu/presentation/pages/create_marker/create_marker_page.dart';
import 'package:hackint/flows/menu/presentation/pages/map/map_page.dart';
import 'package:hackint/flows/menu/presentation/pages/pick_marker_location/pick_marker_location_page.dart';
import 'package:routemaster/routemaster.dart';
import '../flows/complete_registration/presentation/pages/complete_registration.dart';
import '../flows/main/presentation/pages/main/main_page.dart';
import '../flows/menu/presentation/pages/notifications/notifications_page.dart';
import 'helpers/route_map_initial_page.dart';

class AppRouteMap extends RouteMap {
  AppRouteMap({required this.user})
      : super(
          onUnknownRoute: _onUnknownRoute,
          routes: user.isCompletedRegistration
              ? _routes()
              : _completeRegistrationRoute(user),
        );

  final UserModel user;

  static RouteSettings _onUnknownRoute(String route) => const Redirect('/');

  static Map<String, PageBuilder> _routes() {
    return {
      MainPage.path: (_) => _createMaterialPage(
            const RouteMapInitialPage(
              child: MainPage(),
            ),
          ),
      ProfilePage.path: (_) => _createMaterialPage(
            const RouteMapInitialPage(
              child: ProfilePage(),
            ),
          ),
      NotificationsPage.path: (_) => _createMaterialPage(
            const RouteMapInitialPage(
              child: NotificationsPage(),
            ),
          ),
      ..._mapRoute(),
    };
  }

  static Map<String, PageBuilder> _mapRoute([String path = '']) {
    return {
      MapPage.path: (_) => _createMaterialPage(
            const MapPage(),
          ),
      MapPage.path + CreateMarkerPage.path: (_) => _createMaterialPage(
            const CreateMarkerPage(),
          ),
      MapPage.path + CreateMarkerPage.path + PickMarkerLocationPage.path: (_) =>
          _createMaterialPage(
            const PickMarkerLocationPage(),
          ),
    };
  }

  static Map<String, PageBuilder> _completeRegistrationRoute(UserModel user) {
    return {
      CompleteRegistrationPage.path: (_) => _createMaterialPage(
            CompleteRegistrationPage(
              user: user,
            ),
          ),
    };
  }

  static MaterialPage<dynamic> _createMaterialPage(Widget page) {
    return MaterialPage(
      child: page,
      name: page.toString(),
    );
  }
}
