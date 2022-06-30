import 'package:flutter/material.dart';

import '../screens/search_screen.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(SearchScreen.routeName);
      },
      icon: Icon(
        Icons.search,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
