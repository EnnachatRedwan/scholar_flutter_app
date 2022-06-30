import 'package:flutter/material.dart';

import '../themes/theme.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      margin: const EdgeInsets.only(top: 8),
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
            title: const Text(
              'Ennachat Redwan',
              style: TextStyle(fontSize: AppTheme.titleSize),
            ),
            subtitle: const Text(
              'Full-Stack Developer',
              style: TextStyle(
                  fontSize: AppTheme.subTitleSize,
                  color: AppTheme.subTextColor),
            ),
          ),
          InkWell(
            onTap: () {},
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
                  fontSize: AppTheme.buttonTextSize,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
