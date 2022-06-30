import 'package:flutter/material.dart';

import './drawer_item.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(
          height: 30,
        ),
        DrawerItem(
          title: 'HOME',
          icon: Icons.home,
        ),
        DrawerItem(
          title: 'Recommands',
          icon: Icons.record_voice_over,
        ),
      ],
    );
  }
}
