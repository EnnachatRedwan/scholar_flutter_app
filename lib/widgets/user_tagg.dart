import 'package:flutter/material.dart';

class UserTag extends StatelessWidget {
  const UserTag({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: false,
      onChanged: (value) {},
      title: Text(name),
    );
  }
}
