import 'package:flutter/foundation.dart';

class API {
  API({@required this.api_key, @required this.api_pass});

  final String api_key;
  final String api_pass;

  static final String host = '';
  static final int port = 443;

  Uri tokenUri() {
    Uri(
      scheme: 'https',
      host: host,
      port: port,
      path: 'token',
      queryParameters: {'grant_type': 'client_ceredentials'},
    );
  }
}
