import 'package:http/http.dart' as http;
import 'dart:convert';

import './ip_adress.dart';

import '../models/user.dart';

class LoginApi{

  final String email;
  final String password;

  LoginApi(this.email,this.password);

  Future<User?> authUser() async{
    var url=Uri.parse('${IpAdress.ip}/login');
    var response= await http.get(url,headers: {"email":email,"password":password});
    if(response.statusCode==401){
      return null;
    }
    var data=jsonDecode(response.body);
    var user=User(data["fullname"], data["speciality"], data["guid"]);
    return user;
  }
}