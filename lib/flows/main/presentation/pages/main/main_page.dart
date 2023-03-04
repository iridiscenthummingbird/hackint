import 'package:flutter/material.dart';

import 'package:hackint/flows/menu/presentation/widgets/menu_drawer.dart';

import 'widgets/custom_switch_button.dart';
import 'widgets/shedule_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String path = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _MockData.week.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (context, index) {
                  return Material(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Ink(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(
                              color: _selectedIndex == index
                                  ? const Color(0xff643FDB)
                                  : Colors.white,
                            ),
                            color: _selectedIndex == index
                                ? const Color(0xff643FDB).withOpacity(0.15)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              _MockData.week[index],
                              style: _selectedIndex == index
                                  ? Theme.of(context)
                                      .primaryTextTheme
                                      .displayLarge
                                      ?.copyWith(
                                        color: const Color(0xff643FDB),
                                      )
                                  : Theme.of(context)
                                      .primaryTextTheme
                                      .displayLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _MockData.data.length,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: SheduleTile(
                      category: 'Categ',
                      name: 'Name',
                      roomNumber: 1809,
                      time: '10:00',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MockData {
  static List<String> week = [
    'Понеділок',
    'Понеділок',
    'Понеділок',
    'Понеділок',
    'Понеділок',
    'Понеділок',
  ];

  static const List data = ['str', 'opt'];
}
