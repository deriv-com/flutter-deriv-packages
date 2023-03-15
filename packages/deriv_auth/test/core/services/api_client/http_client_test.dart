import 'dart:convert';

import 'package:deriv_auth/core/services/api_client/exceptions/http_exceptions.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  const String mockResponse = '{"title": "Test"}';

  late final MockClient _mockClient;
  late final HttpClient _httpClient;

  setUpAll(() {
    _mockClient = MockClient();
    _httpClient = HttpClient(_mockClient);

    registerFallbackValue(Uri());
  });

  group('HttpClient', () {
    group('.post', () {
      test(
          'returns response of type [Map<String, dynamic>] on status code 200 or 201',
          () async {
        when(
          () => _mockClient.post(
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

        verify(
          () => _mockClient.post(
            any(),
            body: any(named: 'body'),
            headers: any(named: 'headers'),
          ),
        ).called(1);
      });

      test('throws [HttpClientException] on status code other than 200 or 201',
          () async {
        when(
          () => _mockClient.post(
            any(),
            body: any(named: 'body'),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => http.Response(mockResponse, 400));

        expect(
          _httpClient.post(
            url: 'https://jsonplaceholder.typicode.com/posts',
            jsonBody: <String, dynamic>{'body': 'test'},
            headers: <String, String>{'Content-Type': 'application/json'},
          ),
          throwsA(isA<HTTPClientException>()),
        );
      });
    });

    group('.get', () {
      test('returns Response', () {
        when(
          () => _mockClient.get(
            any(),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => http.Response(mockResponse, 200));

        expect(
          _httpClient.get(
            'https://jsonplaceholder.typicode.com/posts',
          ),
          completion(isA<http.Response>()),
        );

        verify(
          () => _mockClient.get(
            any(),
            headers: any(named: 'headers'),
          ),
        ).called(1);
      });
    });
  });
}
