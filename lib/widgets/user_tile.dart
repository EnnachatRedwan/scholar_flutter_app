import 'package:flutter/material.dart';

import '../themes/theme.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.fullname,
    required this.speciality,
    required this.guid
  }) : super(key: key);

  final String fullname;
  final String speciality;
  final String guid;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
