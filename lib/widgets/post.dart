import 'package:flutter/material.dart';

import '../themes/theme.dart';

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
      margin: const EdgeInsets.only(top: 8),
      color: AppTheme.backgroundColor,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppTheme.subTextColor.withOpacity(.5),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            title: Text(
              fullname,
              style: const TextStyle(fontSize: AppTheme.smalTitleSize,color: AppTheme.textColor),
            ),
            subtitle: Text(
              speciality,
              style: const TextStyle(
                  fontSize: AppTheme.smalSubTitleSize,
                  color: AppTheme.subTextColor),
            ),
            //-----------------Follow button-----------------//
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                )),
          ),
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
