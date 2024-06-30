// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;

class URL {
  static const String main = "imlo.uz";

  //basic urls
  static const String letter = "letter";
}

class HttpService {
  //Functions
  static Future<http.Response> GET(url, {params}) async {
    try {
      var uri = Uri.https(URL.main, url, params);
      var res = await http.get(uri);

      if (res.statusCode == 200) {
        return res;
      }
    } catch (e) {
      throw Exception('Error: $e');
    }

    throw Exception('Nimadur nito ketyapti!');
  }
}

enum HttpResponse { error, none, data }
