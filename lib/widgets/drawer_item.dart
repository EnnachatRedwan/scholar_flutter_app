import 'package:flutter/material.dart';

import '../themes/theme.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          color: AppTheme.drawerTextColor,
          fontSize: AppTheme.textSize,
        ),
      ),
    );
  }
}
