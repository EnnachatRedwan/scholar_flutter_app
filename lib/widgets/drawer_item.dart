import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var theme = Provider.of<AppTheme>(context);
    return ListTile(
      leading: Icon(
        icon,
        color: theme.drawerTextColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: theme.drawerTextColor,
          fontSize: theme.textSize,
        ),
      ),
    );
  }
}
