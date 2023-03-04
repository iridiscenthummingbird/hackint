import 'package:hackint/flows/menu/presentation/pages/map/map_page.dart';
import 'package:hackint/flows/menu/presentation/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      body: Center(
        child: TextButton(
          onPressed: () => Routemaster.of(context).push(MapPage.path),
          child: Text('map'),
        ),
      ),
    );
  }
}
