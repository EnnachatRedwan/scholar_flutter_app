import 'package:flutter/material.dart';

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
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      color: AppTheme.backgroundColor,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserTile(fullname: fullname, speciality: speciality),
          //-----------------Tagged people-----------------//
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Ennachat Redwan and $tags others',
              style: const TextStyle(
                color: AppTheme.subTextColor,
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
              style: const TextStyle(fontSize: AppTheme.textSize,color: AppTheme.textColor,),
            ),
          ),
        ],
      ),
    );
  }
}