import 'dart:convert';

import 'package:shiref_bike/services/api.dart';
import 'package:http/http.dart' as http;

class apiService {
  apiService(this.api);

  final API api;

  Future<String> getAccesToken() async {
    final response = await http.post(api.tokenUri().toString(), // https://
        headers: {
          'Authorization': 'Basic ${api.api_key}'
        }); // how to add password
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access'];
      if (accessToken != null) {
        return accessToken;
      } else {
        print('response status !=200');
      }
    }
  }
}
