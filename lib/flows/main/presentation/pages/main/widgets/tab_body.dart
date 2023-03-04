import 'package:flutter/material.dart';
import 'package:hackint/flows/main/presentation/pages/main/widgets/shedule_tile.dart';

class TabBody extends StatelessWidget {
  const TabBody({
    super.key,
    required this.listShedules,
  });

  final List listShedules;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
      child: ListView.builder(
        itemCount: 2,
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
    );
  }
}
