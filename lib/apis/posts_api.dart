import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/post.dart';
import './ip_adress.dart';

class PostsApi {
  static Future<List<PostModel>> fetchPosts(String guid) async {
    List<PostModel> posts = [];
    var url = Uri.parse('${IpAdress.ip}/posts');
    var response = await http.get(url, headers: {"user": guid});
    var data = jsonDecode(response.body);
    if (data.length > 0) {
      for (int i = 0; i < data.length; i++) {
        if (data[i] != null) {
          posts.add(PostModel(
              data[i]["fullname"], data[i]["speciality"], data[i]["content"]));
        }
      }
    }
    return posts;
  }
}
