import 'package:flutter/material.dart';
import 'package:hackint/domain/shared_models/api/user_model.dart';
import 'package:hackint/flows/menu/presentation/pages/map/map_page.dart';
import 'package:routemaster/routemaster.dart';
import '../flows/complete_registration/presentation/pages/complete_registration.dart';
import '../flows/main/presentation/pages/main/main_page.dart';
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
      MapPage.path: (_) => _createMaterialPage(
            const RouteMapInitialPage(
              child: MapPage(),
            ),
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
