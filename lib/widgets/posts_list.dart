import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/post.dart';
import './post.dart';
import '../providers/user_provider.dart';
import '../apis/posts_api.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  bool _fetched = false;

  final List<PostModel> _posts = [];

  @override
  void didChangeDependencies() {
    if (!_fetched) {
      _fetchPosts();
    }
    _fetched = true;
    super.didChangeDependencies();
  }

  void _fetchPosts() async {
    String guid = Provider.of<UserProvider>(context).user!.guid;
    var posts = await PostsApi.fetchPosts(guid);
    setState(() {
      _posts.addAll(posts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (_, i) => Post(
        fullname: _posts[i].fullname,
        content:
            _posts[i].content,
        speciality: _posts[i].speciality,
      ),
    );
  }
}
