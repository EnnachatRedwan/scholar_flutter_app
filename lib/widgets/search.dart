import 'package:flutter/material.dart';
import 'package:scholar_app/models/user.dart';

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

  void _fetchData(String value) async {
    List<User> users=[];
    if (value.trim().isNotEmpty) {
      users = await SearchApi.fetchFullName(value);
    }
    setState(() {
      _users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      color: AppTheme.backgroundColor,
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              _fetchData(value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (_, i) => UserTile(
                  fullname: _users[i].fullname,
                  speciality: _users[i].speciality,
                  guid: _users[i].guid),
            ),
          ),
        ],
      ),
    );
  }
}
