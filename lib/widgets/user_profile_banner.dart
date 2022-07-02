import 'package:flutter/material.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';
import '../themes/theme.dart';
import '../screens/add_post_screen.dart';
import 'package:provider/provider.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user=Provider.of<UserProvider>(context).user;
    var theme=Provider.of<AppTheme>(context);
    return Container(
      color: theme.backgroundColor,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.5),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 35,
              ),
            ),
            title: Text(
              user!.fullname,
              style: TextStyle(fontSize: theme.titleSize,color: theme.textColor),
            ),
            subtitle: Text(
              user.speciality,
              style: TextStyle(
                  fontSize: theme.subTitleSize,
                  color: theme.subTextColor),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AddPostScreen.routeName);
            },
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Text(
                'Add Post',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: theme.buttonTextSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
