import 'package:flutter/material.dart';
import 'package:scholar_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../providers/user_provider.dart';
import '../themes/theme.dart';
import './user_tile.dart';
import '../apis/search_api.dart';

class Search extends StatefulWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<User> _users = [];

  bool _filled = true;

  void _fetchData(String value) async {
    List<User> users = [];
    if (value.trim().isNotEmpty) {
      String fullName =
          Provider.of<UserProvider>(context, listen: false).user!.fullname;
      users = await SearchApi.fetchFullName(value, fullName);
    }
    setState(() {
      _users = users;
      _filled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<AppTheme>(context);
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      color: theme.backgroundColor,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              labelStyle: TextStyle(color: theme.subTextColor),
              prefixIcon: Icon(Icons.search,color: theme.subTextColor,),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.subTextColor),
              ),
            ),
            style: TextStyle(color: theme.textColor),
            onChanged: (value) {
              _filled = false;
              setState(() {
                _fetchData(value);
              });
            },
          ),
          Expanded(
            child: _filled
                ? ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (_, i) => UserTile(
                        fullname: _users[i].fullname,
                        speciality: _users[i].speciality,
                        guid: _users[i].guid),
                  )
                : SpinKitSquareCircle(
                    color: Theme.of(context).primaryColor,
                    size: 50.0,
                  ),
          ),
        ],
      ),
    );
  }
}
