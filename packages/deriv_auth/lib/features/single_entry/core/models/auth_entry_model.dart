import 'package:deriv_auth/deriv_auth.dart';

/// Auth Entry Model class
class AuthEntryModel {
  /// Constructor [AuthEntryModel]
  const AuthEntryModel({
    required this.getStartedPage,
    required this.loginPageModel,
    required this.derivAuthCubit,
    required this.signupPageModel,
    required this.settingPageModel,
    required this.resetPassPageModel,
  });

  /// GetStartedPage data model
  final GetStartedPageModel getStartedPage;

  /// LoginPage data model
  final LoginPageModel loginPageModel;

  /// DerivAuthCubit
  final DerivAuthCubit derivAuthCubit;

  /// SignupPage data model
  final SignupPageModel signupPageModel;

  /// SettingPage data model
  final SettingPageModel settingPageModel;

  /// ResetPassPage data model
  final ResetPassPageModel resetPassPageModel;
}
