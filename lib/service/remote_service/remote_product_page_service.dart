import 'package:shoppet/const.dart';

import 'package:http/http.dart' as http;

class RemoteProductPageService{
  var client = http.Client();
  var remoteUrl = '$baseUrl/product_mobile/bestSaler';

  Future<dynamic>  get() async {
    var response = await client.get(Uri.parse('$remoteUrl'),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer 733|mOyRV6LDndQZB8LkJuuB9XjYdKMU5SjG7cpZzXJu',
    });
    print('Response body product: ${response.body}');
    return response;
  }


  Future<dynamic> getByName({required String keyword})async {

    var response = await client.get(Uri.parse('$remoteUrl?keyword=$keyword'),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer 733|mOyRV6LDndQZB8LkJuuB9XjYdKMU5SjG7cpZzXJu',
    });
    print('Response body product by name: ${response.body}');
    return response;

  }
}
