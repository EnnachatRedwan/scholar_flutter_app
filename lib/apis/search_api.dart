import 'package:http/http.dart' as http;
import 'dart:convert';

import './ip_adress.dart';

import '../models/user.dart';

class SearchApi {
  static Future<List<User>> fetchFullName(String fullname,String userFullName) async {
    List<User> users=[];
    var url = Uri.parse('${IpAdress.ip}/search');
    var response =
        await http.get(url, headers: {"fullname": fullname,"user":userFullName});
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
