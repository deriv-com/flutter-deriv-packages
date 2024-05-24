import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_passkeys/deriv_passkeys.dart';

/// Auth Entry Model class
class AuthEntryModel {
  /// Constructor [AuthEntryModel]
  const AuthEntryModel({
    required this.getStartedPage,
    required this.loginPageModel,
    required this.derivAuthCubit,
    required this.derivPasskeysBloc,
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

  /// DerivAuthCubit
  final DerivPasskeysBloc derivPasskeysBloc;

  /// SignupPage data model
  final SignupPageModel signupPageModel;

  /// SettingPage data model
  final SettingPageModel settingPageModel;

  /// ResetPassPage data model
  final ResetPassPageModel resetPassPageModel;
}
