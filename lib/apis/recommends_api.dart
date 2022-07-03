import 'package:http/http.dart' as http;
import 'dart:convert';

import './ip_adress.dart';

import '../models/user.dart';

class RecommendsApi {
  static Future<List<User>> fetchFollowers(String guid) async {
    List<User> users=[];
    var url = Uri.parse('http://${IpAdress.ip}:3000/recommendation');
    var response =
        await http.get(url, headers: {"user":guid});
    var data = jsonDecode(response.body);
    if(data.length>0){
      for(int i=0;i<data.length;i++){
        if(data[i]!=null){
          users.add(User(data[i]["fullname"], data[i]["speciality"], data[i]["guid"]));
        }
      }
    }
    return users;
  }
}
