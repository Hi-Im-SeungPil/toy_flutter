import 'package:http/http.dart' as http;

class NetworkModule {
  static Future<http.Response> call(String url) async {
    return await http.get(Uri.parse(url));
  }
}