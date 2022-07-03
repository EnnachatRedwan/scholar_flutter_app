import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';
import '../widgets/posts_list.dart';
import '../widgets/search.dart';
import '../widgets/user_profile_banner.dart';
import '../widgets/drawer_list.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<AppTheme>(context);
    return Scaffold(
      backgroundColor: theme.homeBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'ENN NETWORK',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        leading: null,
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              color: theme.backgroundColor,
              child: const DrawerList(),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              children: const [
                UserProfileBanner(),
                Expanded(child: PostsList()),
              ],
            ),
          ),
          const Flexible(
            flex: 1,
            child: Search(),
          ),
        ],
      ),
    );
  }
}
