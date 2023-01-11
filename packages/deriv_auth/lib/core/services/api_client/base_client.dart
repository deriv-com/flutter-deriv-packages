import 'package:http/http.dart' as http;

/// Abstract Http client.
abstract class BaseHttpClient {
  /// Http get request.
  Future<http.Response> get(String url);

  ///  Http post request.
  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> jsonBody,
    Map<String, String>? headers,
  });
}
