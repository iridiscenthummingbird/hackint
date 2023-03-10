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
import '../flows/teacher/presentation/pages/main/main.dart';
import '../flows/teacher/presentation/pages/notifications/notifications.dart';
import '../flows/teacher/presentation/pages/profile/profile.dart';
import 'helpers/route_map_initial_page.dart';

class AppRouteMap extends RouteMap {
  AppRouteMap({required this.user})
      : super(
          onUnknownRoute: _onUnknownRoute,
          routes: _chooseRoute(user),
        );

  static Map<String, RouteSettings Function(RouteData)> _chooseRoute(
      UserModel user) {
    if (!user.isStudent) {
      return _routesTeacher();
    } else if (user.isCompletedRegistration) {
      return _routes();
    } else {
      return _completeRegistrationRoute(user);
    }
  }

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
      MapPage.path: (routeData) => _createMaterialPage(
            MapPage(
              focusedPlaceId: routeData.queryParameters['markerId'] ?? '',
            ),
          ),
      MapPage.path + CreateMarkerPage.path: (_) => _createMaterialPage(
            const CreateMarkerPage(),
          ),
      MapPage.path + CreateMarkerPage.path + PickMarkerLocationPage.path:
          (routeData) => _createMaterialPage(
                PickMarkerLocationPage(
                  name: routeData.queryParameters['name']!,
                  description: routeData.queryParameters['description']!,
                  typeId: routeData.queryParameters['typeId']!,
                  typeIndex: int.parse(routeData.queryParameters['typeIndex']!),
                ),
              ),
    };
  }

  static Map<String, PageBuilder> _routesTeacher() {
    return {
      TeacherMainPage.path: (_) => _createMaterialPage(
            const RouteMapInitialPage(
              child: TeacherMainPage(),
            ),
          ),
      TeacherProfilePage.path: (_) => _createMaterialPage(
            const RouteMapInitialPage(
              child: TeacherProfilePage(),
            ),
          ),
      TeacherNotificationsPage.path: (_) => _createMaterialPage(
            const RouteMapInitialPage(
              child: TeacherNotificationsPage(),
            ),
          ),
      ..._mapRoute(),
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
