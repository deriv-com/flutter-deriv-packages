import 'package:bloc/bloc.dart';
import 'package:deriv_auth/src/auth/auth_error.dart';
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
    emit(DerivAuthLoadingState());

    final LoginRequestModel request = LoginRequestModel(
      type: LoginType.system,
      email: email,
      password: password,
    );

    await _onLoginRequest(request);
  }

  @override
  Future<void> otpLogin({
    required String email,
    required String password,
    required String otp,
  }) async {
    emit(DerivAuthLoadingState());

    final LoginRequestModel request = LoginRequestModel(
      type: LoginType.system,
      email: email,
      password: password,
      otp: otp,
    );

    await _onLoginRequest(request);
  }

  @override
  Future<void> socialLogin({required String oneAllConnectionToken}) async {
    emit(DerivAuthLoadingState());

    final LoginRequestModel request = LoginRequestModel(
      type: LoginType.social,
      oneAllConnectionToken: oneAllConnectionToken,
    );

    await _onLoginRequest(request);
  }

  @override
  Future<void> tokenLogin(String token) async {
    emit(DerivAuthLoadingState());

    await _login(token);
  }

  Future<void> _login(String token) async {
    try {
      final AuthorizeEntity response = await authService.login(token);

      await authService.onLogin(response);

      emit(DerivAuthLoggedInState(response));
    } on DerivAuthException catch (error) {
      emit(DerivAuthErrorState(message: error.message, type: error.type));
    }
  }

  //TODO(mohammad): maybe its better to only expose `tokenLogin` and let multiplier get default account.
  @override
  Future<void> authorizeDefaultAccount() async {
    emit(DerivAuthLoadingState());

    final String? defaultAccountToken =
        (await authService.getDefaultAccount())?.token;

    if (defaultAccountToken == null) {
      emit(DerivAuthLoggedOutState());
      return;
    }

    await _login(defaultAccountToken);
  }

  @override
  Future<void> logout() async {
    emit(DerivAuthLoadingState());
    try {
      await authService.logout();

      await authService.onLogout();
    } on Exception catch (_) {
      emit(DerivAuthLoggedOutState());
    }
  }

  Future<void> _onLoginRequest(LoginRequestModel request) async {
    try {
      final List<AccountModel> accounts =
          await authService.fetchAccounts(request: request);

      final List<AccountModel> supportedAccounts =
          authService.filterSupportedAccounts(accounts);

      if (supportedAccounts.isEmpty) {
        emit(
          DerivAuthErrorState(
            message: _notAvailableCountryMessage,
            type: AuthErrorType.unsupportedCountry,
          ),
        );
        return;
      }

      final AccountModel? savedDefaultAccount =
          await authService.getDefaultAccount();

      final String? defaultAccountToken =
          savedDefaultAccount?.token ?? supportedAccounts.first.token;

      if (defaultAccountToken != null) {
        await _login(defaultAccountToken);
      }
    } on DerivAuthException catch (error) {
      emit(DerivAuthErrorState(message: error.message, type: error.type));
    }
  }

  @override
  Stream<DerivAuthState> get output => stream;
}
