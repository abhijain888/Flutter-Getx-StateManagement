import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NetworkApi {
  static Future<dynamic> getResponse({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      return jsonDecode(response.body);
      // if (response.statusCode == 200) {
      //   return jsonDecode(response.body);
      // }
    } on SocketException {
      print('No internet Connection');
    }
  }
}
