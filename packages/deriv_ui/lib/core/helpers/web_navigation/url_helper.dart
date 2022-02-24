import 'package:uuid/uuid.dart';

import 'package:flutter_multipliers/features/login/enums.dart';

/// Gets deriv url.
Uri get derivUrl => Uri(scheme: 'https', host: 'deriv.com');

/// Gets Deriv P2P url.
Uri get dp2pUrl =>
    Uri(scheme: derivUrl.scheme, host: derivUrl.host, path: '/p2p');

/// Gets Deriv P2P google play url.
Uri get dp2pGooglePlayUrl => Uri(
      scheme: derivUrl.scheme,
      host: 'play.google.com',
      path: '/store/apps/details',
      queryParameters: <String, String>{'id': 'com.deriv.dp2p'},
    );

/// Gets Deriv P2P app store url.
Uri get dp2pAppStoreUrl => Uri(
      scheme: 'https',
      host: 'apps.apple.com',
      path: '/gh/app/deriv-dp2p/id1506901451',
    );

/// Gets feedback survey url.
Uri get feedbackSurveyUrl => Uri(
      scheme: 'https',
      host: 'survey.survicate.com',
      path: '/8afda2126ba30683',
    );

/// Gets help centre url.
Uri get helpCentreUrl => Uri(
      scheme: derivUrl.scheme,
      host: derivUrl.host,
      path: '/help-centre',
      queryParameters: <String, String>{'platform': 'derivgo'},
    );

/// Gets contact us url.
Uri contactUsUrl({bool openLiveChat = true}) => Uri(
      scheme: derivUrl.scheme,
      host: derivUrl.host,
      path: '/contact_us',
      queryParameters: <String, String>{
        'platform': 'derivgo',
        'is_livechat_open': '$openLiveChat',
      },
    );

/// Gets terms and conditions url.
Uri get termsOfUseUrl => Uri(
      scheme: derivUrl.scheme,
      host: derivUrl.host,
      path: '/terms-and-conditions',
      queryParameters: <String, String>{'platform': 'derivgo'},
    );

/// Gets `OneAll` Api url for social authentication.
Uri getSocialAuthUrl(SocialAuthType socialLoginType) {
  const String baseUrl =
      'https://deriv.api.oneall.com/socialize/connect/mobile/';
  const String callbackUrl = '&callback_uri=deriv://multipliers';

  final String uuid = const Uuid().v1();
  final String socialLoginTypeName = socialLoginType.name;

  return Uri.parse('$baseUrl$socialLoginTypeName/?nonce=$uuid$callbackUrl');
}

/// Gets oauth url for specific path.
Uri getOAuthUrl({required String host, required String path}) =>
    Uri(scheme: 'https', host: host, path: 'oauth2/api/v1/$path');

/// Gets path through authentication authorization url.
String getPtaAuthorizeUrl(String host) =>
    '${getOAuthUrl(host: host, path: 'authorize')}';

/// Gets path through authentication login url.
String getPtaLoginUrl({required String host, String? token}) =>
    '${getOAuthUrl(host: host, path: 'pta_login')}/${token ?? ''}';

/// Gets path through authentication verification url.
String getPtaVerifyUrl(String host) =>
    '${getOAuthUrl(host: host, path: 'verify')}';
