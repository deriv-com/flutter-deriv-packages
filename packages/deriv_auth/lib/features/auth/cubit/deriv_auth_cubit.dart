import 'package:bloc/bloc.dart';

import 'package:deriv_auth/core/exceptions/deriv_auth_exception.dart';
import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/auth_error/auth_error.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:deriv_auth/core/services/token/models/enums.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/features/auth/deriv_auth_io.dart';
import 'package:deriv_auth/features/auth/services/base_auth_service.dart';

part 'deriv_auth_state.dart';

/// This Cubit is the single source of truth for user login status,
/// and it is responsible for all login functionality.
class DerivAuthCubit extends Cubit<DerivAuthState> implements DerivAuthIO {
  /// Initialize a [DerivAuthCubit].
  DerivAuthCubit({required this.authService}) : super(DerivAuthLoadingState());

  /// [BaseAuthService] handles all login logic of cubit.
  final BaseAuthService authService;

  @override
  Future<void> systemLogin({
    required String email,
    required String password,
    String? otp,
  }) async {
    emit(DerivAuthLoadingState());

    await _loginRequest(
      GetTokensRequestModel(
        type: AuthType.system,
        email: email,
        password: password,
        otp: otp,
      ),
    );
  }

  @override
  Future<void> socialLogin({
    required String oneAllConnectionToken,
    final String? signupProvider,
  }) async {
    emit(DerivAuthLoadingState());

    await _loginRequest(
      GetTokensRequestModel(
        type: AuthType.social,
        oneAllConnectionToken: oneAllConnectionToken,
        signupProvider: signupProvider,
      ),
    );
  }

  @override
  Future<void> tokenLogin(String token) async {
    emit(DerivAuthLoadingState());

    await _tokenLoginRequest(
      token,
      accounts: await authService.getLatestAccounts(),
    );
  }

  Future<void> _loginRequest(GetTokensRequestModel request) async {
    try {
      emit(DerivAuthLoggedInState(await authService.onLoginRequest(request)));
    } on DerivAuthException catch (error) {
      emit(DerivAuthErrorState(message: error.message, type: error.type));
    }
  }

  Future<void> _tokenLoginRequest(
    String token, {
    required List<AccountModel> accounts,
  }) async {
    try {
      emit(
        DerivAuthLoggedInState(
          await authService.login(token, accounts: accounts),
        ),
      );
    } on DerivAuthException catch (error) {
      emit(DerivAuthErrorState(message: error.message, type: error.type));
    }
  }

  @override
  Future<void> authorizeDefaultAccount() async {
    emit(DerivAuthLoadingState());

    final String? defaultAccountToken =
        (await authService.getDefaultAccount())?.token;

    if (defaultAccountToken == null) {
      emit(DerivAuthLoggedOutState());

      return;
    }

    await _tokenLoginRequest(
      defaultAccountToken,
      accounts: await authService.getLatestAccounts(),
    );
  }

  @override
  Future<void> logout() async {
    emit(DerivAuthLoadingState());

    try {
      await authService.logout();
      await authService.onLoggedOut();

      emit(DerivAuthLoggedOutState());
    } on Exception catch (_) {
      emit(DerivAuthLoggedOutState());
    }
  }

  @override
  Stream<DerivAuthState> get output => stream;
}
