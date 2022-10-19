import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../core/api_client/base_client.dart';
import '../core/api_client/exceptions/http_exceptions.dart';
import '../models/account/account.dart';
import '../models/login/enums.dart';
import '../models/login/login_request.dart';
import '../models/login/login_response.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final BaseHttpClient client;

  AuthCubit({required this.client}) : super(AuthInitialState());

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

  void getAppToken({required String appToken}) {
    /// get jwt token from repo
    emit(AuthAppAuthorizedState(jwtToken: appToken));
  }

  Future<void> basicLogin({
    required String email,
    required String password,
    required String appToken,
    Function(List<AccountModel>)? onAccountFetched,
    required String appId,
    required String endpoint,
    required String jwtToken,
  }) async {
    emit(AuthLoadingState());

    try {
      LoginRequestModel loginRequestModel = LoginRequestModel(
        type: LoginType.system,
        email: email,
        password: password,
      );

      final LoginResponseModel response = await _login(
        jwtToken: jwtToken,
        appid: appId,
        endpoint: endpoint,
        loginRequestModel: loginRequestModel,
      );

      final List<AccountModel> accounts = response.tokens!
          .map<AccountModel>(
            (Token? token) =>
                AccountModel(accountId: token!.loginid, token: token.token),
          )
          .toList();

      onAccountFetched?.call(accounts);
    } on HTTPClientException catch (e) {
      if (e.errorCode == invalidTokenError) {
        /// TODO should notify jwt auth cubit
        // await _initializeLogin(clearJwtToken: true);
      } else {
        emit(
          AuthFailureState(
            errorCode: e.errorCode,
            errorMessage: e.message,
          ),
        );
      }
    } on Exception catch (e) {
      // emit(
      //   const LoginUnauthorizedState(
      //       errorMessage: 'Unexpected Error Happened'),
      // );
      emit(
        AuthFailureState(
          errorMessage: e.toString(),
        ),
      );

      log('$AuthCubit initializeLogin() error: $e');
    }

    // try {
    // if (_jwtToken == null || clearJwtToken) {
    //   _jwtToken = await getJwtToken(
    //     endpoint: ConnectionCubit.endpoint,
    //     appId: ConnectionCubit.appId,
    //   );
    // }

    // final List<AccountModel> accounts = response.tokens!
    //     .map<AccountModel>(
    //       (Token? token) =>
    //           AccountModel(accountId: token!.loginid, token: token.token),
    //     )
    //     .toList();

    // await BlocManager.instance.fetch<AuthCubit>().login(
    //       accounts: accounts,
    //       refreshToken: response.refreshToken,
    //       signupProvider: response.socialType != null &&
    //               response.socialType == SocialType.signup
    //           ? signupProvider
    //           : null,
    //     );
    // } on HTTPClientException catch (e) {
    //   if (e.errorCode == invalidTokenError) {
    //     await _initializeLogin(clearJwtToken: true);
    //   } else {
    //     emit(
    //       LoginUnauthorizedState(
    //         errorCode: e.errorCode,
    //         errorMessage: e.message,
    //       ),
    //     );
    //   }
    // } on Exception catch (e) {
    //   emit(
    //     const LoginUnauthorizedState(errorMessage: 'Unexpected Error Happened'),
    //   );

    //   dev.log('$AuthCubit initializeLogin() error: $e');
    // }
    return;
  }

  Future<LoginResponseModel> _login({
    required String jwtToken,
    required String appid,
    required String endpoint,
    required LoginRequestModel loginRequestModel,
  }) async {
    const String path = 'login';

    final Map<String, dynamic> jsonResponse = await client.post(
      url: _getUrl(path, endpoint),
      jsonBody: loginRequestModel.copyWith(appId: int.parse(appid)).toJson(),
      headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
    );

    return LoginResponseModel.fromJson(jsonResponse);
  }

  String _getUrl(String path, String endpoint) =>
      'https://$endpoint/oauth2/api/v1/$path';
}
