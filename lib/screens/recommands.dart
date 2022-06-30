import 'package:flutter/material.dart';
import '../widgets/user_tile.dart';

import '../themes/theme.dart';
import '../widgets/back_button.dart';

class RecommandsScreen extends StatelessWidget {
  const RecommandsScreen({Key? key}) : super(key: key);

  static const String routeName = '/recommands';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'ENN NETWORK',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        leading: const AppBarBackButton(),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        color: AppTheme.backgroundColor,
        child: ListView(
          children: const [
            UserTile(fullname: 'Ennachat', speciality: 'Redwan'),
            UserTile(fullname: 'Ennachat', speciality: 'Redwan'),
            UserTile(fullname: 'Ennachat', speciality: 'Redwan'),
            UserTile(fullname: 'Ennachat', speciality: 'Redwan'),
          ],
        ),
      ),
    );
  }
}
