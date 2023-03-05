import 'package:hackint/flows/menu/presentation/pages/notifications/notifications_page.dart';
import 'package:hackint/flows/menu/presentation/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NotificationsPage(),
          ),
        ),
      ),
      drawer: const MenuDrawer(),
      body: const Center(
        child: Text("Main"),
      ),
    );
  }
}
