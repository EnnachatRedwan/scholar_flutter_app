import 'dart:convert';

import 'package:http/http.dart' as http;

import './ip_adress.dart';

class AddPostApi{
  static Future<void> addPost(String user,String content,List<String> tags) async {
    var url = Uri.parse('http://${IpAdress.ip}:3000/add-post');
    await http.post(url, body: {"content": content,"user":user,"tags":jsonEncode(tags)});
  }
}
