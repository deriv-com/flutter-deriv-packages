import 'package:bloc/bloc.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_exception.dart';
import 'package:deriv_auth/src/models/login/enums.dart';

/// This Cubit is the single source of truth for user login status, and
/// it is responsible for all login functionality.
class DerivAuthCubit extends Cubit<DerivAuthState> implements DerivAuthIO {
  /// Initialize a [DerivAuthCubit].
  DerivAuthCubit({required this.authService}) : super(DerivAuthLoadingState());

  /// [BaseAuthService] handles all login logic of cubit.
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

    await _loginRequest(request);
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

    await _loginRequest(request);
  }

  @override
  Future<void> socialLogin({
    required String oneAllConnectionToken,
    final String? signupProvider,
  }) async {
    final LoginRequestModel request = LoginRequestModel(
      type: LoginType.social,
      oneAllConnectionToken: oneAllConnectionToken,
      signupProvider: signupProvider,
    );

    await _loginRequest(request);
  }

  @override
  Future<void> tokenLogin(String token) async {
    final List<AccountModel> accountsList =
        await authService.getLatestAccounts();

    await _tokenLoginRequest(
      token,
      accountsList: accountsList,
    );
  }

  Future<void> _tokenLoginRequest(
    String token, {
    required List<AccountModel> accountsList,
  }) async {
    try {
      final AuthorizeEntity authorize =
          await authService.login(token, accountsList: accountsList);

      emit(DerivAuthLoggedInState(authorize));
    } on DerivAuthException catch (error) {
      emit(DerivAuthErrorState(message: error.message, type: error.type));
    }
  }

  Future<void> _loginRequest(LoginRequestModel request) async {
    try {
      final AuthorizeEntity authorize =
          await authService.onLoginRequest(request);

      emit(DerivAuthLoggedInState(authorize));
    } on DerivAuthException catch (error) {
      emit(DerivAuthErrorState(message: error.message, type: error.type));
    }
  }

  @override
  Future<void> authorizeDefaultAccount() async {
    emit(DerivAuthLoadingState());

    final String? defaultAccountToken =
        (await authService.getDefaultAccount())?.token;
    final List<AccountModel> accountsList =
        await authService.getLatestAccounts();

    if (defaultAccountToken == null) {
      emit(DerivAuthLoggedOutState());
      return;
    }

    await _tokenLoginRequest(
      defaultAccountToken,
      accountsList: accountsList,
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
}
