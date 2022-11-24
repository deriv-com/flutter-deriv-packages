import 'dart:convert';
import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:deriv_auth/src/auth/auth_error.dart';
import 'package:deriv_auth/src/models/account/account.dart';

import '../core/api_client/exceptions/http_exceptions.dart';
import '../core/api_client/http_client.dart';
import '../models/app_auth/app_authorization_response.dart';
import '../models/app_auth/app_authorization_reuest.dart';
import '../models/app_auth_challenge/app_auth_challenge_response.dart';
import '../models/app_auth_challenge_request.dart';
import '../models/login/enums.dart';
import '../models/login/login_request.dart';
import '../models/login/login_response.dart';
import '../auth/auth_cubit.dart';

// import 'package:deriv_web_view/web_view.dart';

// import 'package:flutter_deriv_api/api/response/authorize_response_result.dart';
// import 'package:flutter_deriv_api/services/connection/http_client/exceptions/http_client_exception.dart';
// import 'package:flutter_deriv_api/services/connection/http_client/http_client.dart';
// import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';

// import 'package:flutter_deriv_bloc_manager/manager.dart';

// import 'package:flutter_multipliers/core/bloc_manager/state_listener_contracts/auth_state_listener.dart';
// import 'package:flutter_multipliers/core/bloc_manager/state_listener_contracts/connection_state_listener.dart';
// import 'package:flutter_multipliers/core/enums.dart';
// import 'package:flutter_multipliers/core/models/account_model.dart';
// import 'package:flutter_multipliers/core/models/auth_error_model.dart';
// import 'package:flutter_multipliers/core/states/auth/auth_cubit.dart';
// import 'package:flutter_multipliers/core/states/auth/auth_error.dart';
// import 'package:flutter_multipliers/features/login/enums.dart';
// import 'package:flutter_multipliers/features/login/models/login_request_model.dart';
// import 'package:flutter_multipliers/features/login/models/login_response_model.dart';

part 'login_state.dart';

/// This class handles the business logic related to performing login.
class LoginCubit extends Cubit<LoginState> {
  final String Function() appToken;
  final String Function() endpoint;
  final String Function() appId;
  final AuthCubit authCubit;

  /// Initializes the cubit with an initial state of [LoginInitialState].
  LoginCubit({
    required this.appToken,
    required this.endpoint,
    required this.appId,
    required this.authCubit,
  }) : super(const LoginInitialState());

  /// Error occurs if 2FA is not passed in the login request.
  static const String missingOtpError = 'MISSING_ONE_TIME_PASSWORD';

  /// Error occurs if expired/invalid jwt-token is passed in the login request.
  static const String invalidTokenError = 'INVALID_TOKEN';

  /// Error occurs if invalid 2FA code is passed in the login request.
  static const String invalidAuthCodeError = 'TFA_FAILURE';

  /// Error occurs if invalid credential is passed in `system` login.
  static const String invalidCredentialError = 'INVALID_CREDENTIALS';

  /// Error occurs if account has been flagged as `self_closed`.
  static const String selfClosedError = 'SELF_CLOSED';

  /// Error occurs if tries to login on deactivated account.
  static const String accountUnavailableError = 'AccountUnavailable';

  LoginRequestModel _loginRequestModel = LoginRequestModel();

  String? _jwtToken;

  /// Updates the login request model with [oneAllConnectionToken].
  Future<void> initializeSocialLogin({
    required String oneAllConnectionToken,
    Function(List<AccountModel>)? onAccountsFetched,
    String? signupProvider,
  }) async {
    _loginRequestModel = LoginRequestModel(
      type: LoginType.social,
      oneAllConnectionToken: oneAllConnectionToken,
    );

    await _initializeLogin(
      onAccountFetched: onAccountsFetched,
      signupProvider: signupProvider,
    );
  }

  /// Updates the login request model with [email] & [password].
  Future<void> initializeSystemLogin({
    required String email,
    required String password,
  }) async {
    _loginRequestModel = LoginRequestModel(
      type: LoginType.system,
      email: email,
      password: password,
    );

    await _initializeLogin();
  }

  /// Updates the login request model with [otp].
  Future<void> initializeLoginWithTwoFactorAuth(String otp) async {
    _loginRequestModel = _loginRequestModel.copyWith(otp: otp);

    await _initializeLogin();
  }

  Future<void> _initializeLogin({
    Function(List<AccountModel>)? onAccountFetched,
    bool clearJwtToken = false,
    String? signupProvider,
  }) async {
    emit(const LoginLoadingState());

    try {
      if (_jwtToken == null || clearJwtToken) {
        _jwtToken = await getJwtToken(
          endpoint: endpoint(),
          appId: appId(),
          appToken: appToken(),
        );
      }

      final LoginResponseModel response = await _login(_jwtToken!);

      final List<AccountModel> accounts = response.tokens!
          .map<AccountModel>(
            (Token? token) =>
                AccountModel(accountId: token!.loginid, token: token.token),
          )
          .toList();

      onAccountFetched?.call(accounts);

      await authCubit.login(
        accounts: accounts,
        refreshToken: response.refreshToken,
      );

      emit(const LoginAuthorizedState());
    } on HTTPClientException catch (e) {
      if (e.errorCode == invalidTokenError) {
        await _initializeLogin(clearJwtToken: true);
      } else {
        emit(
          LoginUnauthorizedState(
            errorCode: e.errorCode,
            errorMessage: e.message,
          ),
        );
      }
    } on Exception catch (e) {
      emit(
        const LoginUnauthorizedState(errorMessage: 'Unexpected Error Happened'),
      );

      dev.log('$LoginCubit initializeLogin() error: $e');
    }
  }

  Future<LoginResponseModel> _login(String jwtToken) async {
    const String path = 'login';

    final Map<String, dynamic> jsonResponse = await HttpClient().post(
      url: _getUrl(path),
      jsonBody: _loginRequestModel.copyWith(appId: int.parse(appId())).toJson(),
      headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
    );

    return LoginResponseModel.fromJson(jsonResponse);
  }

  String _getUrl(String path) => 'https://$endpoint/oauth2/api/v1/$path';

  /// Try to connect to web socket.
  // void reconnection() =>
  //     BlocManager.instance.fetch<ConnectionCubit>().reconnect();

  // @override
  // Future<void> onLogin({
  //   Authorize? authorizedAccount,
  //   bool hasConnection = true,
  //   AuthErrorModel? authErrorModel,
  // }) async {
  // if (authorizedAccount != null && hasConnection) {
  //   emit(const LoginAuthorizedState());
  // } else if (authErrorModel != null) {
  //   emit(
  //     LoginUnauthorizedState(
  //       authErrorType: authErrorModel.authError,
  //       errorMessage: authErrorModel.errorMessage,
  //     ),
  //   );
  // }
  // }

  // @override
  // void onLogout({String? reason}) =>
  //     emit(LoginUnauthorizedState(logoutReason: reason));

  // @override
  // void onLoginError({AuthErrorModel? error}) {
  //   if (error!.authError == AuthErrorType.unsupportedCountry) {
  //     emit(
  //       LoginUnauthorizedState(
  //         authErrorType: error.authError,
  //         errorMessage: error.errorMessage,
  //       ),
  //     );
  //   }
  // }

  /// Gets Jwt token for authorizing the application.
  Future<String> getJwtToken({
    required String endpoint,
    required String appId,
    required String appToken,
  }) async {
    final AppAuthorizationChallengeResponseModel challenge =
        await _getAppAuthorizationChallenge(endpoint: endpoint, appId: appId);

    final String solution = _solveLoginChallenge(
      appToken: appToken,
      challenge: challenge.challenge,
    );

    return _authorizeApp(
      solution: solution,
      expire: challenge.expire,
      endpoint: endpoint,
      appId: appId,
    );
  }

  Future<String> _authorizeApp({
    required String solution,
    required int expire,
    required String endpoint,
    required String appId,
  }) async {
    final Map<String, dynamic> jsonResponse = await HttpClient().post(
      url: _getPtaAuthorizeUrl(endpoint),
      jsonBody: AppAuthorizationRequestModel(
        appId: int.parse(appId),
        solution: solution,
        expire: expire,
      ).toJson(),
    );

    return AppAuthorizationResponseModel.fromJson(jsonResponse).token;
  }

  Future<AppAuthorizationChallengeResponseModel> _getAppAuthorizationChallenge({
    required String endpoint,
    required String appId,
  }) async {
    final Map<String, dynamic> jsonResponse = await HttpClient().post(
      url: _getPtaVerifyUrl(endpoint),
      jsonBody: AppAuthorizationChallengeRequestModel(
        appId: int.parse(appId),
      ).toJson(),
    );

    return AppAuthorizationChallengeResponseModel.fromJson(jsonResponse);
  }

  /// This function solves login challenge sent by server.
  String _solveLoginChallenge({
    required String appToken,
    required String challenge,
  }) {
    final List<int> encodedAppToken = utf8.encode(appToken);
    final List<int> encodedChallenge = utf8.encode(challenge);

    final Hmac hmacSHA256 = Hmac(sha256, encodedAppToken);
    final Digest digest = hmacSHA256.convert(encodedChallenge);

    return digest.toString();
  }

  /// Gets path through authentication login url.
  String getPtaLoginUrl({required String host, String? token}) =>
      '${_getOAuthUrl(host: host, path: 'pta_login')}/${token ?? ''}';

  /// Gets oauth url for specific path.
  Uri _getOAuthUrl({required String host, required String path}) =>
      Uri(scheme: 'https', host: host, path: 'oauth2/api/v1/$path');

  /// Gets path through authentication verification url.
  String _getPtaVerifyUrl(String host) =>
      '${_getOAuthUrl(host: host, path: 'verify')}';

  /// Gets path through authentication authorization url.
  String _getPtaAuthorizeUrl(String host) =>
      '${_getOAuthUrl(host: host, path: 'authorize')}';
}
