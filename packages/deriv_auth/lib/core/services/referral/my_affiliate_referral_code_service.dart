import 'package:deriv_auth/core/exceptions/referral_code_exception.dart';
import 'package:deriv_auth/core/extensions/extensions.dart';
import 'package:deriv_auth/core/services/api_client/base_client.dart';
import 'package:deriv_auth/core/services/referral/base_referral_code_service.dart';
import 'package:deriv_auth/core/services/referral/models/my_affiliate_referral_code_request_model.dart';
import 'package:http/http.dart';

/// `My Affiliate` Implementation of [BaseReferralCodeService].
class MyAffiliateReferralCodeService implements BaseReferralCodeService {
  /// Initializes [MyAffiliateReferralCodeService].
  MyAffiliateReferralCodeService({required this.client, required this.request});

  static const String _tokenTag = 'TOKEN';
  static const String _errorTag = 'ERROR';
  static const String _errorMessageTag = 'STRING';

  static const String _referralErrorDefaultMessage =
      'Unexpected error while processing referral code';

  /// Http client.
  final BaseHttpClient client;

  /// Request model.
  final MyAffiliateReferralCodeRequestModel request;

  @override
  Future<String> getReferralToken(String referralCode) async {
    final Map<String, String> queryParameters = <String, String>{
      'FEED_ID': request.feedId,
      'BRAND_ID': request.brandId,
      'CODE': referralCode,
    };

    final Uri uri = Uri(
      scheme: 'https',
      host: request.host,
      path: '/feeds.php',
      queryParameters: queryParameters,
    );

    final Response response =
        await client.get(uri.toString(), basicAuthToken: request.authToken);

    final String result = response.body;

    if (result.contains(_errorTag)) {
      final String? errorMessage = result.parseXMLTag(_errorMessageTag);

      throw ReferralCodeException(errorMessage ?? _referralErrorDefaultMessage);
    }

    final String? token = result.parseXMLTag(_tokenTag);

    if (token == null) {
      throw ReferralCodeException(_referralErrorDefaultMessage);
    }

    return token;
  }
}
