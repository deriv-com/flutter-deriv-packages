import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'base_http_client.dart';
import 'http_client_exception.dart';

/// A concrete implementation of [BaseHttpClient].
/// Uses [http.Client] to make http requests.
///
/// [client] is an optional parameter that can be used to inject a custom http client.
/// If not provided, a new instance of [http.Client] will be created.
class HttpClient extends BaseHttpClient {
  /// Initializes a [HttpClient] class.
  HttpClient([http.Client? client]) : _client = client ?? http.Client();

  final http.Client _client;

  /// Http get request.
  @override
  Future<http.Response> get(
    String url, {
    String? basicAuthToken,
  }) {
    final Map<String, String> headers = <String, String>{
      if (basicAuthToken != null) 'authorization': 'Basic $basicAuthToken'
    };

    return _client.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  /// Http post request.
  @override
  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> jsonBody,
    Map<String, String>? headers,
  }) async {
    final String jsonString = convert.jsonEncode(jsonBody);

    final http.Response response =
        await _client.post(Uri.parse(url), body: jsonString, headers: headers);

    final Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    if (response.statusCode ~/ 100 != 2) {
      throw HTTPClientException(
        errorCode: jsonResponse['error_code'],
        statusCode: response.statusCode,
        message: jsonResponse.containsKey('message')
            ? jsonResponse['message']
            : 'Server Error',
      );
    }

    return jsonResponse;
  }
}
