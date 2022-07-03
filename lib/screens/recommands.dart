import 'package:flutter/material.dart';
import '../apis/recommends_api.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';
import '../widgets/user_tile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../themes/theme.dart';
import '../widgets/back_button.dart';

class RecommandsScreen extends StatefulWidget {
  const RecommandsScreen({Key? key}) : super(key: key);

  static const String routeName = '/recommands';

  @override
  State<RecommandsScreen> createState() => _RecommandsScreenState();
}

class _RecommandsScreenState extends State<RecommandsScreen> {
  final List<User> _users = [];
  bool _filled = false;
  bool didFetched = false;

  @override
  void didChangeDependencies() {
    if (!didFetched) {
      _fetchFollowers(Provider.of<UserProvider>(context).user!.guid);
    }
    didFetched = true;
    super.didChangeDependencies();
  }

  void _fetchFollowers(String user) async {
    var users = await RecommendsApi.fetchFollowers(user);
    setState(() {
      _users.addAll(users);
      _filled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bounds = MediaQuery.of(context).size;
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
        leading: const AppBarBackButton(),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding:
            EdgeInsets.symmetric(vertical: 8, horizontal: bounds.width / 10),
        color: theme.backgroundColor,
        child: _filled
                ? Center(
                  child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: _users.length,
                        itemBuilder: (_, i) => UserTile(fullname: _users[i].fullname,guid: _users[i].guid,speciality: _users[i].speciality),
                      ),
                    ),
                )
                : Container(
                    margin: const EdgeInsets.all(30),
                    child: SpinKitSquareCircle(
                      color: Theme.of(context).primaryColor,
                      size: 50.0,
                    ),
                  ),
      ),
    );
  }
}
