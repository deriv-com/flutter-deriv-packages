import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_http_client/deriv_http_client.dart';

/// Auth Entry Model class
class AuthEntryModel {
  /// Constructor [AuthEntryModel]
  const AuthEntryModel(
      {required this.getStartedPage,
      required this.loginPageModel,
      required this.derivAuthService,
      required this.socialAuthService,
      required this.signupPageModel,
      required this.settingPageModel,
      required this.resetPassPageModel,
      required this.httpClient,
      required this.appToken,
      required this.connectionInfo,
      required this.derivAuthRepository});

  /// GetStartedPage data model
  final GetStartedPageModel getStartedPage;

  /// LoginPage data model
  final LoginPageModel loginPageModel;

  /// DerivAuthService
  final DerivAuthService derivAuthService;

  /// SignupPage data model
  final SignupPageModel signupPageModel;

  /// SettingPage data model
  final SettingPageModel settingPageModel;

  /// ResetPassPage data model
  final ResetPassPageModel resetPassPageModel;

  final DerivSocialAuthService socialAuthService;

  final BaseHttpClient httpClient;

  final String appToken;

  final AuthConnectionInfo connectionInfo;

  final BaseAuthRepository derivAuthRepository;
}
