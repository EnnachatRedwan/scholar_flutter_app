import 'package:flutter/material.dart';

import '../themes/theme.dart';
import './user_tile.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      color: AppTheme.backgroundColor,
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                UserTile(
                    fullname: 'Abli Nawal', speciality: 'Mobile Developper'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
