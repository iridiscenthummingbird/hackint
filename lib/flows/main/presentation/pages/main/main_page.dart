import 'package:flutter/material.dart';
import 'package:hackint/flows/main/presentation/pages/main/widgets/tab_body.dart';
import 'package:hackint/flows/menu/presentation/widgets/menu_drawer.dart';

import 'widgets/custom_switch_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String path = '/';
  // final Map week = const {
  //   0: 'Mon',
  //   1: 'Tue',
  //   2: 'Wen',
  //   3: 'Thu',
  //   4: 'Fri',
  //   5: 'Sat',
  // };

  final List week = const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

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
            tabs: week
                .map((day) => Tab(
                      child: Text(
                        day,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        drawer: const MenuDrawer(),
        body: const TabBarView(
          children: [
            TabBody(listShedules: []),
            TabBody(listShedules: []),
            TabBody(listShedules: []),
            TabBody(listShedules: []),
            TabBody(listShedules: []),
            TabBody(listShedules: []),
          ],
        ),
      ),
    );

    //   drawer: const MenuDrawer(),
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: 40,
    //           child: ListView.separated(
    //             scrollDirection: Axis.horizontal,
    //             itemCount: _MockData.week.length,
    //             separatorBuilder: (context, index) {
    //               return const SizedBox(width: 10);
    //             },
    //             itemBuilder: (context, index) {
    //               return Material(
    //                 child: InkWell(
    //                   borderRadius: BorderRadius.circular(20),
    //                   onTap: () {
    //                     setState(() {
    //                       _selectedIndex = index;
    //                     });
    //                   },
    //                   child: Ink(
    //                     child: Container(
    //                       padding: const EdgeInsets.symmetric(horizontal: 10),
    //                       decoration: BoxDecoration(
    //                         borderRadius: const BorderRadius.all(
    //                           Radius.circular(20),
    //                         ),
    //                         border: Border.all(
    //                           color: _selectedIndex == index
    //                               ? const Color(0xff643FDB)
    //                               : Colors.white,
    //                         ),
    //                         color: _selectedIndex == index
    //                             ? const Color(0xff643FDB).withOpacity(0.15)
    //                             : Colors.transparent,
    //                       ),
    //                       child: Center(
    //                         child: Text(
    //                           _MockData.week[index],
    //                           style: _selectedIndex == index
    //                               ? Theme.of(context)
    //                                   .primaryTextTheme
    //                                   .displayLarge
    //                                   ?.copyWith(
    //                                     color: const Color(0xff643FDB),
    //                                   )
    //                               : Theme.of(context)
    //                                   .primaryTextTheme
    //                                   .displayLarge,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               );
    //             },
    //           ),
    //         ),
    //         Expanded(
    //           child: ListView.builder(
    //             itemCount: _MockData.data.length,
    //             itemBuilder: (context, index) {
    //               return const Padding(
    //                 padding: EdgeInsets.only(bottom: 16),
    //                 child: SheduleTile(
    //                   category: 'Categ',
    //                   name: 'Name',
    //                   roomNumber: 1809,
    //                   time: '10:00',
    //                 ),
    //               );
    //             },
    //           ),
    //         ),
    //       ],
    //     ),

    // );
  }
}
