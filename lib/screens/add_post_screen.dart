import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../themes/theme.dart';
import '../widgets/back_button.dart';
import '../widgets/user_tagg.dart';
import '../apis/followers_api.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';
import '../apis/add_post_api.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  static const String routeName = '/add-post';

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool didFetched = false;

  final _formKey = GlobalKey<FormState>();

  String _contentText = '';

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

  final List<String> _tags=[];

  void _toggleTag(String guid){
    _tags.contains(guid)?_tags.remove(guid):_tags.add(guid);
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _postContent(_contentText,
          Provider.of<UserProvider>(context, listen: false).user!.guid,_tags);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Posted!'),
          duration: const Duration(seconds: 2),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  void _postContent(String content, String user,List<String> tags) async {
    await AddPostApi.addPost(user, content,tags);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<AppTheme>(context);
    return Scaffold(
      backgroundColor: theme.homeBackgroundColor,
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
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Content',
                  hintStyle: TextStyle(color: theme.subTextColor),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.subTextColor),
                  ),
                ),
                style: TextStyle(color: theme.textColor),
                maxLines: 7,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a post content.';
                  }
                  if (value.length < 20) {
                    return 'Post content should be greater than 20.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _contentText = value!;
                },
              ),
            ),
            _filled
                ? SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: _users.length,
                      itemBuilder: (_, i) => UserTag(name: _users[i].fullname,toggleTag:()=>_toggleTag(_users[i].guid)),
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
              onTap: () {
                _saveForm();
              },
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
