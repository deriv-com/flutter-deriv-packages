import 'dart:developer' as logger;

import 'package:bloc/bloc.dart';
import 'package:deriv_auth/src/auth/models/authorize.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_exception.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_io.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_service.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_state.dart';
import 'package:deriv_auth/src/models/account/account.dart';
import 'package:deriv_auth/src/models/login/enums.dart';
import 'package:deriv_auth/src/models/login/login_request.dart';

class DerivAuthCubit extends Cubit<DerivAuthState> implements DerivAuthIO {
  //TODO(mohammad): loading state at initial?
  DerivAuthCubit({required this.authService}) : super(DerivAuthLoadingState());

  //TODO(mohammad): localization
  static const _notAvailableCountryMessage =
      'This service is not available in your country.';

  final BaseAuthService authService;

  @override
  Future<void> systemLogin({
    required String email,
    required String password,
  }) async {
    final LoginRequestModel request = LoginRequestModel(
      type: LoginType.system,
      email: email,
      password: password,
    );

    await _doLogin(request);
  }

  @override
  Future<void> otpLogin({
    required String email,
    required String password,
    required String otp,
  }) async {
    final LoginRequestModel request = LoginRequestModel(
      type: LoginType.system,
      email: email,
      password: password,
      otp: otp,
    );

    await _doLogin(request);
  }

  @override
  Future<void> socialLogin({required String oneAllConnectionToken}) async {
    final LoginRequestModel request = LoginRequestModel(
      type: LoginType.social,
      oneAllConnectionToken: oneAllConnectionToken,
    );

    await _doLogin(request);
  }

  @override
  Future<void> authorizeDefaultAccount() async {
    final AccountModel? savedDefaultAccount =
        await authService.getDefaultAccount();

    if (savedDefaultAccount == null) {
      emit(DerivAuthLoggedOutState());
      return;
    }

    final AuthorizeEntity response =
        await authService.login(account: savedDefaultAccount);

    await authService.onLogin(response);

    emit(DerivAuthLoggedInState(response));
  }

  @override
  Future<void> logout() async {
    try {
      await authService.logout();

      await authService.onLogout();

      emit(DerivAuthLoggedOutState());
    } catch (e) {
      logger.log('$DerivAuthCubit logout() error: $e');
    }
  }

  Future<void> _doLogin(LoginRequestModel request) async {
    try {
      final List<AccountModel> accounts =
          await authService.fetchAccounts(request: request);

      final List<AccountModel> supportedAccounts =
          authService.filterSupportedAccounts(accounts);

      if (supportedAccounts.isEmpty) {
        emit(
          DerivAuthErrorState(message: _notAvailableCountryMessage),
        );
        return;
      }

      final AccountModel? savedDefaultAccount =
          await authService.getDefaultAccount();

      final AccountModel defaultAccount =
          savedDefaultAccount ?? supportedAccounts.first;

      final AuthorizeEntity response =
          await authService.login(account: defaultAccount);

      await authService.onLogin(response);

      emit(DerivAuthLoggedInState(response));
    } on DerivAuthException catch (error) {
      emit(DerivAuthErrorState(message: error.message));
    }
  }

  @override
  Stream<DerivAuthState> get output => stream;
}
