import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiMethod {
  Future<dynamic> get({required String url}) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
