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

    try {
      final List<AccountModel> accounts =
          await authService.fetchAccounts(request: request);

      if (accounts.isNotEmpty) {
        authorize(accounts: accounts);
      } //TODO(mohammad): emit error on else?
    } on DerivAuthException catch (error) {
      emit(DerivAuthErrorState(message: error.message));
    }
  }

  @override
  Future<void> otpLogin({
    required String email,
    required String password,
    required String otp,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> socialLogin({required String oneAllConnectionToken}) {
    throw UnimplementedError();
  }

  @override
  Future<void> authorize({required List<AccountModel> accounts}) async {
    final List<AccountModel> supportedAccounts =
        authService.filterSupportedAccounts(accounts);

    if (supportedAccounts.isNotEmpty) {
      AccountModel defaultAccount = supportedAccounts.first;
      //TODO(mohammad): If user default account is in this list, we should select that, otherwise first item.
      final AccountModel? savedDefaultAccount =
          await authService.getDefaultAccount();

      if (savedDefaultAccount != null) {
        defaultAccount = savedDefaultAccount;
      }

      try {
        final AuthorizeEntity response =
            await authService.authorizeSingleAccount(account: defaultAccount);

        await authService.onLogin(response);

        emit(DerivAuthLoggedInState(response));
      } on DerivAuthException catch (error) {
        emit(DerivAuthErrorState(message: error.message));
      }
    } else {
      emit(
        DerivAuthErrorState(
          message: 'This service is not available in your country.',
        ),
      );
    }
  }

  @override
  Future<void> authorizeDefaultAccount() {
    throw UnimplementedError();
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

  @override
  Stream<DerivAuthState> get output => stream;
}
