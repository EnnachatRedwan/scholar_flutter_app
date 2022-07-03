import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../themes/theme.dart';
import '../apis/follow_api.dart';

class UserTile extends StatelessWidget {
  const UserTile(
      {Key? key,
      required this.fullname,
      required this.speciality,
      required this.guid})
      : super(key: key);

  final String fullname;
  final String speciality;
  final String guid;

  void _follow(String guid1, String guid2) async {
    await FollowApi.createFollow(guid1, guid2);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<AppTheme>(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: theme.subTextColor.withOpacity(.5),
        child: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        fullname,
        style: TextStyle(fontSize: theme.smalTitleSize, color: theme.textColor),
      ),
      subtitle: Text(
        speciality,
        style: TextStyle(
            fontSize: theme.smalSubTitleSize, color: theme.subTextColor),
      ),
      //-----------------Follow button-----------------//
      trailing: guid.isNotEmpty
          ? IconButton(
              onPressed: () {
                String guid1 = Provider.of<UserProvider>(context, listen: false)
                    .user!
                    .guid;
                _follow(guid1, guid);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Following successfully'),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Theme.of(context).primaryColor,
                ));
              },
              icon: Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
            )
          : null,
    );
  }
}
