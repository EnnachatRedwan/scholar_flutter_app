import 'package:http/http.dart' as http;

import './ip_adress.dart';

class RegisterApi{

  final String email;
  final String password;
  final String fullName;
  final String speciality;

  RegisterApi(this.email,this.password,this.fullName,this.speciality);

  Future<bool> regUser() async{
    var url=Uri.parse('http://${IpAdress.ip}:3000/register');
    var response= await http.post(url,body: {"email":email,"password":password,"fullname":fullName,"speciality":speciality});
    if(response.statusCode==500){
      return false;
    }
   return true;
  }
}