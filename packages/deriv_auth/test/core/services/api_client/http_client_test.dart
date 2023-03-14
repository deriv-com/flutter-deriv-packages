import 'dart:convert';

import 'package:deriv_auth/deriv_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late final MockClient _client;
  late final HttpClient _httpClient;

  setUpAll(() {
    _client = MockClient();
    _httpClient = HttpClient();

    registerFallbackValue(Uri());
  });

  group('post', () {
    test('returns json response on status code 200 or 201', () async {
      const String mockResponse = '{"title": "Test"}';

      when(
        () => _client.post(
          any(),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer((_) async => http.Response(mockResponse, 201));

      final Map<String, dynamic> response = await _httpClient.post(
        url: 'https://jsonplaceholder.typicode.com/posts',
        jsonBody: <String, dynamic>{'body': 'test'},
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      expect(
        response,
        json.decode(mockResponse),
      );
    });
  });
}
