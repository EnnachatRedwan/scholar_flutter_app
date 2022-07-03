import 'package:flutter/material.dart';

import './post.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
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
    ]);
  }
}
