import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';
import './user_tile.dart';

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.content,
    required this.fullname,
    required this.speciality,
    required this.tags,
  }) : super(key: key);

  final String fullname;
  final String speciality;
  final int tags;
  final String content;

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<AppTheme>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      color: theme.backgroundColor,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserTile(fullname: fullname, speciality: speciality, guid: ''),
          //-----------------Tagged people-----------------//
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              '$fullname and $tags others',
              style: TextStyle(
                color: theme.subTextColor,
              ),
            ),
          ),
          //-----------------Divider-----------------//
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          //-----------------post content-----------------//
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              content,
              style: TextStyle(
                fontSize: theme.textSize,
                color: theme.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
