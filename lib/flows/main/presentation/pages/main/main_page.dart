import 'package:hackint/flows/menu/presentation/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: MenuDrawer(),
      body: Center(
        child: Text("Main"),
      ),
    );
  }
}
