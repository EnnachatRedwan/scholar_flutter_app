import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholar_app/themes/theme.dart';

import '../providers/user_provider.dart';
import './drawer_item.dart';
import '../screens/recommands.dart';
import '../screens/add_followers.dart';
import '../screens/login_screen.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme=Provider.of<AppTheme>(context);
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
        InkWell(
          onTap: () {
            theme.toggleAppearance();
          },
          child: DrawerItem(
            title: theme.isLight? 'Dark':'Light',
            icon: theme.isLight? Icons.dark_mode:Icons.light_mode,
          ),
        ),
        InkWell(
          onTap: () {
            Provider.of<UserProvider>(context,listen: false).user=null;
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          },
          child: const DrawerItem(
            title: 'Log out',
            icon: Icons.logout,
          ),
        ),
      ],
    );
  }
}
