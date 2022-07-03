import 'package:http/http.dart' as http;

import './ip_adress.dart';

class FollowApi {
  static Future<void> createFollow(String guid1,String guid2) async {
    var url = Uri.parse('${IpAdress.ip}/follow');
    await http.post(url, body: {"user1": guid1,"user2":guid2});
  }
}
