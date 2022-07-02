import 'package:flutter/material.dart';

import './drawer_item.dart';
import '../screens/recommands.dart';
import '../screens/add_followers.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RecommandsScreen.routeName);
          },
          child: const DrawerItem(
            title: 'Recommands',
            icon: Icons.record_voice_over,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AddFollowers.routeName);
          },
          child: const DrawerItem(
            title: 'Followers',
            icon: Icons.person_add_alt_rounded,
          ),
        ),
      ],
    );
  }
}
