import 'package:flutter/material.dart';

import '../themes/theme.dart';
import '../widgets/back_button.dart';
import '../widgets/user_tagg.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  static const String routeName = '/add-post';

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
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Content',
                border: OutlineInputBorder(),
              ),
              maxLines: 7,
            ),
            Container(
              height: 300,
              child: ListView(
                children: const [
                  UserTag(name: 'Ennachat Redwan'),
                  UserTag(name: 'Ennachat Redwan'),
                  UserTag(name: 'Ennachat Redwan'),
                  UserTag(name: 'Ennachat Redwan'),
                  UserTag(name: 'Ennachat Redwan'),
                  UserTag(name: 'Ennachat Redwan'),
                ],
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
                    fontSize: AppTheme.buttonTextSize,
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
