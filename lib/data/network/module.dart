import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class NetworkModule {
  static Future<http.Response> call(String url) async {
    return await http.get(Uri.parse(url));
  }
}