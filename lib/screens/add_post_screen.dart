import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../themes/theme.dart';
import '../widgets/back_button.dart';
import '../widgets/user_tagg.dart';
import '../apis/followers_api.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  static const String routeName = '/add-post';

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
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
    var theme= Provider.of<AppTheme>(context);
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
        padding: const EdgeInsets.all(8),
        color: theme.backgroundColor,
        child: ListView(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Content',
                border: OutlineInputBorder(),
              ),
              maxLines: 7,
            ),
            _filled
                ? SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: _users.length,
                      itemBuilder: (_, i) => UserTag(name: _users[i].fullname),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.all(30),
                    child: SpinKitSquareCircle(
                      color: Theme.of(context).primaryColor,
                      size: 50.0,
                    ),
                  ),
            InkWell(
              onTap: () {},
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
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
      ),
    );
  }
}
