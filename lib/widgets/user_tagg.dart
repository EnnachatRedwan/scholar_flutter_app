import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';

class UserTag extends StatelessWidget {
  const UserTag({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<AppTheme>(context);
    return Container(
      color: theme.homeBackgroundColor,
      margin: const EdgeInsets.all(8),
      child: CheckboxListTile(
        value: false,
        onChanged: (value) {},
        title: Text(
          name,
          style:
              TextStyle(color: theme.textColor, fontSize: theme.smalTitleSize),
        ),
      ),
    );
  }
}
