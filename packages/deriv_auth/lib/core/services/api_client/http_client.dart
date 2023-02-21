import 'dart:convert' as convert;

import 'package:deriv_auth/core/services/api_client/base_client.dart';
import 'package:http/http.dart' as http;

import 'exceptions/http_exceptions.dart';

/// Singleton class for http requests.
class HttpClient extends BaseHttpClient {
  /// Initializes http client.
  factory HttpClient() => _instance;

  HttpClient._internal();

  static final HttpClient _instance = HttpClient._internal();

  /// Http get request.
  @override
  Future<http.Response> get(
    String url, {
    String? basicAuthToken,
  }) {
    final Map<String, String> headers = <String, String>{
      if (basicAuthToken != null) 'authorization': 'Basic $basicAuthToken'
    };

    return http.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  ///  Http post request.
  @override
  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> jsonBody,
    Map<String, String>? headers,
  }) async {
    final String jsonString = convert.jsonEncode(jsonBody);

    final http.Response response =
        await http.post(Uri.parse(url), body: jsonString, headers: headers);

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
