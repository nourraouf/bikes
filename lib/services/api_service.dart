import 'dart:convert';
//import 'dart:html';

import 'package:shiref_bike/services/api.dart';
import 'package:http/http.dart' as http;

class apiService {
  apiService(this.api);

  final API api;

  Future<String> getAccesToken() async {
    print(api.api_key);
    print(api.api_pass);
    final response = await http.post(
        'http://nabilmokhtar.pythonanywhere.com/api-token-auth/', // https://
        //  api.tokenUri().toString(),
        body: jsonEncode(<String, String>{
          'username': api.api_key,
          'password': api.api_pass
        }),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['token'];
      print(accessToken);
      if (accessToken != null) {
        print(accessToken);
        return accessToken;
      } else {
        print('response status !=200');
      }
    }
  }
}
