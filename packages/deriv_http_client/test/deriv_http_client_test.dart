import 'package:deriv_http_client/src/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

void main() {
  group('HttpClient Tests =>', () {
    HttpClient httpClient = HttpClient();

    test('GET Request.', () async {
      final String testUrl = 'https://example.com';
      final http.Response response = await httpClient.get(testUrl);

      expect(response.statusCode, equals(200));
    });
  });
}
