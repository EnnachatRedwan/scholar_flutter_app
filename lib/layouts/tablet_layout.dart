import 'package:flutter/material.dart';

import '../themes/theme.dart';
import '../widgets/post.dart';
import '../widgets/user_profile_banner.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.homeBackgroundColor,
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              color: AppTheme.backgroundColor,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'HOME',
                      style: TextStyle(fontSize: AppTheme.smalTitleSize),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Recommands',
                      style: TextStyle(fontSize: AppTheme.smalTitleSize),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              children: [
                const UserProfileBanner(),
                Expanded(
                  child: ListView(
                    children: const [
                      Post(
                        fullname: 'Abli Nawal',
                        tags: 2,
                        content:
                            'Machne learnin is one of the best fields you can learn in 2022 because the whole world needs machine learning scientists',
                        speciality: 'Mobile Developper',
                      ),
                      Post(
                        fullname: 'Ennachat Ayoub',
                        tags: 1,
                        content:
                            'Machne learnin is one of the best fields you can learn in 2022 because the whole world needs machine learning scientists',
                        speciality: 'Web Developper',
                      ),
                      Post(
                        fullname: 'Abli Nawal',
                        tags: 2,
                        content:
                            'Machne learnin is one of the best fields you can learn in 2022 because the whole world needs machine learning scientists',
                        speciality: 'Mobile Developper',
                      ),
                      Post(
                        fullname: 'Ennachat Ayoub',
                        tags: 1,
                        content:
                            'Machne learnin is one of the best fields you can learn in 2022 because the whole world needs machine learning scientists',
                        speciality: 'Web Developper',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
