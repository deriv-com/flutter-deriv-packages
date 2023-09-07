import 'package:deriv_auth/core/exceptions/referral_code_exception.dart';
import 'package:deriv_auth/core/services/referral/my_affiliate_referral_code_service.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  const MyAffiliateReferralCodeRequestModel requestModel =
      MyAffiliateReferralCodeRequestModel(
          authToken: 'authToken',
          brandId: 'brandId',
          host: 'host',
          feedId: 'feedId');
  const String referralCode = 'referralCode';
  const String _tokenTag = 'TOKEN';
  const String _errorTag = 'ERROR';

  late final MockHttpClient _client;
  late final MyAffiliateReferralCodeService _referralCodeService;

  setUpAll(() {
    _client = MockHttpClient();
    _referralCodeService =
        MyAffiliateReferralCodeService(client: _client, request: requestModel);
  });

  group('My affiliate referral service tests =>', () {
    test('should return refferal token.', () {
      when(() => _client.get(
                any(),
                basicAuthToken: requestModel.authToken,
              ))
          .thenAnswer(
              (_) async => Response('<$_tokenTag>mock</$_tokenTag>', 200));

      expect(_referralCodeService.getReferralToken(referralCode),
          completion('mock'));
    });

    test('should throw [ReferralCodeException] on error tag received.', () {
      when(() => _client.get(
                any(),
                basicAuthToken: requestModel.authToken,
              ))
          .thenAnswer(
              (_) async => Response('<$_errorTag>mock</$_errorTag>', 200));

      expect(_referralCodeService.getReferralToken(referralCode),
          throwsA(isA<ReferralCodeException>()));
    });

    test('should throw [ReferralCodeException] on no referral code received.',
        () {
      when(() => _client.get(
            any(),
            basicAuthToken: requestModel.authToken,
          )).thenAnswer((_) async => Response('<dummy>mock</dummy>', 200));

      expect(_referralCodeService.getReferralToken(referralCode),
          throwsA(isA<ReferralCodeException>()));
    });
  });
}
