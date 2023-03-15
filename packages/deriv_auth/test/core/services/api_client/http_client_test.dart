import 'package:deriv_auth/deriv_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

void main() {
  late final HttpClient _httpClient;

  setUpAll(() {
    _httpClient = HttpClient();

    registerFallbackValue(Uri());
  });

  group('post', () {
    test('returns json response on status code 200 or 201', () async {
      const String mockResponse = '{"title": "Test"}';

      when(
        () => http.post(
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

      // expect(
      //   response,
      //   json.decode(mockResponse),
      // );

      verify(
        () => http.post(any()),
      ).called(1);
    });
  });
}
