import 'package:flutter/material.dart';
import '../widgets/user_tile.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';
import '../widgets/back_button.dart';

class RecommandsScreen extends StatelessWidget {
  const RecommandsScreen({Key? key}) : super(key: key);

  static const String routeName = '/recommands';

  @override
  Widget build(BuildContext context) {
    var bounds=MediaQuery.of(context).size;
    var theme=Provider.of<AppTheme>(context);
    return Scaffold(
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
        leading: const AppBarBackButton(),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(vertical:8,horizontal: bounds.width/10),
        color: theme.backgroundColor,
        child: ListView(
          children: const [
            UserTile(fullname: 'Ennachat', speciality: 'Redwan',guid: ''),
            UserTile(fullname: 'Ennachat', speciality: 'Redwan',guid: ''),
            UserTile(fullname: 'Ennachat', speciality: 'Redwan',guid: ''),
            UserTile(fullname: 'Ennachat', speciality: 'Redwan',guid: ''),
          ],
        ),
      ),
    );
  }
}
