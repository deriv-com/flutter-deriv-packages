import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:test/test.dart';

void main() {
  group('Http Client Exception Tests =>', () {
    test('toString() returns correct string.', () {
      expect(
        HTTPClientException(
          statusCode: 400,
          message: 'message',
          errorCode: 'invalidToken',
        ).toString(),
        '400 HTTP Error Ocurred: message',
      );
    });
  });
}
