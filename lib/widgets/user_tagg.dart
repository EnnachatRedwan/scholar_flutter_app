import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';

class UserTag extends StatefulWidget {
  const UserTag({
    Key? key,
    required this.name,
    required this.toggleTag,
  }) : super(key: key);

  final String name;
  final VoidCallback toggleTag;

  @override
  State<UserTag> createState() => _UserTagState();
}

class _UserTagState extends State<UserTag> {
  bool isTagged = false;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<AppTheme>(context);
    return Container(
      color: theme.homeBackgroundColor,
      margin: const EdgeInsets.all(8),
      child: CheckboxListTile(
        value: isTagged,
        onChanged: (value) {
          setState(() {
            isTagged = !isTagged;
            widget.toggleTag();
          });
        },
        title: Text(
          widget.name,
          style:
              TextStyle(color: theme.textColor, fontSize: theme.smalTitleSize),
        ),
      ),
    );
  }
}
