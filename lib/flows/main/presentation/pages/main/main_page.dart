import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackint/flows/main/presentation/pages/main/widgets/tab_body.dart';
import 'package:hackint/flows/menu/presentation/widgets/menu_drawer.dart';

import 'widgets/custom_switch_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String path = '/';

  final week = const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: week.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Shedule',
            style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff1C1243),
                ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: CustomSwitchButton(
                initialValue: false,
              ),
            )
          ],
          bottom: TabBar(
            labelStyle: GoogleFonts.rubik(
              color: Theme.of(context).appBarTheme.foregroundColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            indicatorColor: Colors.transparent,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).appBarTheme.foregroundColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor.withOpacity(0.15),
            ),
            tabs: week.map((day) => Tab(text: day)).toList(),
          ),
        ),
        drawer: const MenuDrawer(),
        body: TabBarView(
          children: List.generate(week.length, (index) => index)
              .map(
                (index) => const TabBody(
                  listShedules: [],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
