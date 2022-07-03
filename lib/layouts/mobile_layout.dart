import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';
import '../widgets/drawer_list.dart';
import '../widgets/posts_list.dart';
import '../widgets/search_button.dart';
import '../widgets/user_profile_banner.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    var theme=Provider.of<AppTheme>(context);
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
        actions: const [
          SearchButton(),
        ],
        leading: Builder(
          builder: (ctx) => IconButton(
            onPressed: () {
              Scaffold.of(ctx).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: theme.backgroundColor,
        child: const DrawerList(),
      ),
      body: Column(
        children: const [
          UserProfileBanner(),
          Expanded(
            child: PostsList()
          ),
        ],
      ),
    );
  }
}