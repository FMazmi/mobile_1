import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork2 {
  static final String baseUrl = "https://www.mmobomb.com/api1/news";
  static Future<List<dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;
    // debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl), headers: {});
    // debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
  }

  static Future<List<dynamic>> _processResponse(http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return [];
      // return {"error": true};
    }
  }

  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}