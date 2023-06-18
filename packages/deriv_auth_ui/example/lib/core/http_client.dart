import 'package:deriv_auth/core/services/api_client/base_client.dart';
import 'package:http/http.dart';

class HttpClient implements BaseHttpClient {
  @override
  Future<Response> get(String url, {String? basicAuthToken}) {
    return Future.value(Response('', 200));
  }

  @override
  Future<Map<String, dynamic>> post(
      {required String url,
      required Map<String, dynamic> jsonBody,
      Map<String, String>? headers,
      }) {
    return Future.value({});
  }
}
