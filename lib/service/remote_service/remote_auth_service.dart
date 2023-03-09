import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoppet/const.dart';

class RemoteAuthService {
  var client = http.Client();
  var remoteUrl = '$baseUrl';

  Future<dynamic>  register ({
    required String email,
    required String password
}) async {
    var body = {
      "name":email ,
      'email':email,
      "password":password
    };
    var response = await client.post(Uri.parse('$remoteUrl/register'),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer 733|mOyRV6LDndQZB8LkJuuB9XjYdKMU5SjG7cpZzXJu',
    },body:jsonEncode(body));
    print('Response body: ${response.body}');
    return response;
  }


  Future<dynamic>  login ({
    required String email,
    required String password
  }) async {
    var body = {
      "name":email ,
      'email':email,
      "password":password
    };
    var response = await client.post(Uri.parse('$remoteUrl/login'),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer 733|mOyRV6LDndQZB8LkJuuB9XjYdKMU5SjG7cpZzXJu',
    },body:jsonEncode(body));
    print('Response body: ${response.body}');
    return response;
  }
}