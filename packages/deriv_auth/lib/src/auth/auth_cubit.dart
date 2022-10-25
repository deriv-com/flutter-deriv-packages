import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:deriv_auth/src/core/constants/error_codes.dart';
import 'package:deriv_auth/src/repo/i_auth_repo.dart';

import '../core/api_client/base_client.dart';
import '../core/api_client/exceptions/http_exceptions.dart';
import '../models/account/account.dart';
import '../models/login/login_request.dart';
import '../models/login/login_response.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final BaseHttpClient client;
  final IBasicAuthRepo repo;

  AuthCubit({required this.client, required this.repo})
      : super(AuthInitialState());

  void getAppToken({required String appToken}) {
    /// get jwt token from repo
    emit(AuthAppAuthorizedState(jwtToken: appToken));
  }

  Future<void> basicLogin({
    required LoginRequestModel request,
    required String appToken,
    Function(List<AccountModel>)? onAccountFetched,
    required String endpoint,
    required String jwtToken,
  }) async {
    emit(AuthLoadingState());

    try {
      final LoginResponseModel response = await repo.loginWithEmailAndPassword(
        request: request,
        endpoint: endpoint,
        jwtToken: jwtToken,
      );

      final List<AccountModel> accounts = response.tokens!
          .map<AccountModel>(
            (Token? token) =>
                AccountModel(accountId: token!.loginid, token: token.token),
          )
          .toList();

      onAccountFetched?.call(accounts);

      /// TODO missing call to bloc manager here
    } on HTTPClientException catch (e) {
      if (e.errorCode == ErrorCodes.invalidTokenError) {
        /// call refresh jwtToken from parent
      } else {
        emit(
          AuthFailureState(
            errorCode: e.errorCode,
            errorMessage: e.message,
          ),
        );
      }
    } on Exception catch (e) {
      emit(
        AuthFailureState(
          errorMessage: e.toString(),
        ),
      );

      log('$AuthCubit initializeLogin() error: $e');
    }
    return;
  }

  Future<LoginResponseModel> _login({
    required String jwtToken,
    required String endpoint,
    required LoginRequestModel loginRequestModel,
  }) async {
    const String path = 'login';

    final Map<String, dynamic> jsonResponse = await client.post(
      url: _getUrl(path, endpoint),
      jsonBody: loginRequestModel
          .copyWith(appId: int.parse(loginRequestModel.appId.toString()))
          .toJson(),
      headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
    );

    return LoginResponseModel.fromJson(jsonResponse);
  }

  String _getUrl(String path, String endpoint) =>
      'https://$endpoint/oauth2/api/v1/$path';
}
