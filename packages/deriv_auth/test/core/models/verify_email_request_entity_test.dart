import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  final VerifyEmailRequestEntity mockVerifyEmailEntity =
      VerifyEmailRequestEntity(
    type: '0',
    verifyEmail: 'verified',
    urlParameters: <String, dynamic>{'url': 'url'},
    reqId: 1,
  );

  const Map<String, dynamic> mockVerifyEmailEntityJson = <String, dynamic>{
    'type': '0',
    'verify_email': 'verified',
    'url_parameters': <String, dynamic>{'url': 'url'},
    'req_id': 1,
  };

  group('VerifyEmailRequestEntity', () {
    test('supports fromJson', () {
      final VerifyEmailRequestEntity verifyEmailRequestEntity =
          VerifyEmailRequestEntity.fromJson(mockVerifyEmailEntityJson);

      expect(verifyEmailRequestEntity.type, '0');
      expect(verifyEmailRequestEntity.verifyEmail, 'verified');
      expect(verifyEmailRequestEntity.urlParameters,
          <String, dynamic>{'url': 'url'});
      expect(verifyEmailRequestEntity.reqId, 1);
    });

    test(
      'supports toJson',
      () => expect(
        mockVerifyEmailEntity.toJson(),
        <String, dynamic>{
          'type': '0',
          'verify_email': 'verified',
          'passthrough': null,
          'url_parameters': <String, dynamic>{'url': 'url'},
          'req_id': 1,
        },
      ),
    );

    test('has valid copyWith', () {
      expect(
        mockVerifyEmailEntity.copyWith(type: '1').type,
        '1',
      );
      expect(
          mockVerifyEmailEntity
              .copyWith(verifyEmail: 'notverified')
              .verifyEmail,
          'notverified');
      expect(
          mockVerifyEmailEntity.copyWith(
              urlParameters: <String, dynamic>{'url': 'url2'}).urlParameters,
          <String, dynamic>{'url': 'url2'});
      expect(mockVerifyEmailEntity.copyWith(reqId: 2).reqId, 2);
      expect(
        mockVerifyEmailEntity.copyWith().type,
        '0',
      );
    });

    const VerifyEmailResponseEntity mockVerifyEmailResponseEntity =
        VerifyEmailResponseEntity(
      verifyEmail: false,
    );

    group('VerifyEmailResponsEntity', () {
      test('supports fromJson', () {
        final VerifyEmailResponseEntity verifyEmailResponseEntity =
            VerifyEmailResponseEntity.fromJson(<String, dynamic>{
          'verify_email': false,
        });

        expect(verifyEmailResponseEntity.verifyEmail, false);
        expect(verifyEmailResponseEntity, isA<VerifyEmailResponseEntity>());
      });

      test(
        'supports toJson',
        () => expect(
          mockVerifyEmailResponseEntity.toJson(),
          <String, dynamic>{
            'verify_email': false,
          },
        ),
      );

      test('has a valid copyWith', () {
        final VerifyEmailResponseEntity copyVerifyEmailResponseEntity =
            mockVerifyEmailResponseEntity.copyWith(verifyEmail: true);
        final VerifyEmailResponseEntity secondCopyVerifyEmailResponseEntity =
            mockVerifyEmailResponseEntity.copyWith();
        expect(copyVerifyEmailResponseEntity.verifyEmail, true);
        expect(secondCopyVerifyEmailResponseEntity.verifyEmail, false);
      });
    });
  });
}
