import 'package:deriv_auth/core/services/api_client/exceptions/http_exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('HttpClientException', () {
    test('has concise toString', () {
      expect(
        HTTPClientException(
                statusCode: 400, message: 'message', errorCode: 'invalidToken')
            .toString(),
        '400 HTTP Error Ocurred: message',
      );
    });
  });
}
