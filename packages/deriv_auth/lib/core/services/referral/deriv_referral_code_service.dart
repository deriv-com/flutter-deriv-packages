import 'package:deriv_auth/core/exceptions/referral_code_exception.dart';
import 'package:deriv_auth/core/extensions/extensions.dart';
import 'package:deriv_auth/core/services/api_client/base_client.dart';
import 'package:deriv_auth/core/services/referral/base_referral_code_service.dart';
import 'package:http/http.dart';

/// Deriv Implementation of [BaseReferralCodeService].
class DerivReferralCodeService implements BaseReferralCodeService {
  /// Initializes [DerivReferralCodeService].
  DerivReferralCodeService(this.client);

  static const String _envVariableKey = 'MY_AFFILIATE_AUTH_TOKEN';

  static const String _brandId = '2';
  static const String _feedId = '15';

  static const String _schema = 'https';
  static const String _host = 'admin.binary.com';
  static const String _path = '/feeds.php';

  static const String _tokenTag = 'TOKEN';
  static const String _errorTag = 'ERROR';
  static const String _errorMessageTag = 'STRING';

  static const String _referralErrorDefaultMessage =
      'Unexpected error while processing referral code';

  /// Http client.
  final BaseHttpClient client;

  @override
  Future<String> getReferralToken(String referralCode) async {
    final Map<String, String> queryParameters = <String, String>{
      'FEED_ID': _feedId,
      'BRAND_ID': _brandId,
      'CODE': referralCode,
    };

    final Uri uri = Uri(
      scheme: _schema,
      host: _host,
      path: _path,
      queryParameters: queryParameters,
    );

    const String authToken = String.fromEnvironment(_envVariableKey);

    final Response response =
        await client.get(uri.toString(), basicAuthToken: authToken);

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
