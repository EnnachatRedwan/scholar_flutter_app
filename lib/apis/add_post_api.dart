import 'dart:convert';

import 'package:http/http.dart' as http;

import './ip_adress.dart';

class AddPostApi{
  static Future<void> addPost(String user,String content,List<String> tags) async {
    print(tags);
    var url = Uri.parse('http://${IpAdress.ip}:3000/add-post');
    var response =
        await http.post(url, body: {"content": content,"user":user,"tags":jsonEncode(tags)});
  }
}
