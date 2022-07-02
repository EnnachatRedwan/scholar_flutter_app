import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../themes/theme.dart';
import '../widgets/back_button.dart';
import '../apis/followers_api.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';
import '../widgets/user_tile.dart';

class AddFollowers extends StatefulWidget {
  const AddFollowers({Key? key}) : super(key: key);

  static const String routeName = '/add-followers';

  @override
  State<AddFollowers> createState() => _AddFollowersState();
}

class _AddFollowersState extends State<AddFollowers> {
  bool didFetched = false;

  @override
  void didChangeDependencies() {
    if (!didFetched) {
      _fetchFollowers(Provider.of<UserProvider>(context).user!.guid);
    }
    didFetched = true;
    super.didChangeDependencies();
  }

  final List<User> _users = [];

  bool _filled = false;

  void _fetchFollowers(String user) async {
    var users = await FollowersApi.fetchFollowers(user);
    setState(() {
      _users.addAll(users);
      _filled = true;
    });
  }

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
        child: _filled
            ? SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (_, i) => UserTile(
                      fullname: _users[i].fullname,
                      speciality: _users[i].speciality,
                      guid: _users[i].guid),
                ),
              )
            : Center(
                child: SpinKitSquareCircle(
                  color: Theme.of(context).primaryColor,
                  size: 50.0,
                ),
              ),
      ),
    );
  }
}
