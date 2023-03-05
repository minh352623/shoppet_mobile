import 'package:http/http.dart' as http;
import 'package:shoppet/const.dart';

class RemoteBannerService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/slider_mobile/all';

  Future<dynamic>  get() async {
    var response = await client.get(Uri.parse('$remoteUrl'),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer 733|mOyRV6LDndQZB8LkJuuB9XjYdKMU5SjG7cpZzXJu',
    });
    print('Response body: ${response.body}');
    return response;
  }
}