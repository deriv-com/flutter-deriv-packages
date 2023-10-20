import 'package:bloc/bloc.dart';

import 'package:deriv_auth/core/exceptions/deriv_auth_exception.dart';
import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/auth_error/auth_error.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/core/services/token/models/enums.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/features/auth/deriv_auth_io.dart';
import 'package:deriv_auth/features/auth/services/base_auth_service.dart';
import 'package:deriv_auth/features/social_auth/models/social_auth_dto.dart';

part 'deriv_auth_state.dart';

/// This Cubit is the single source of truth for user login status,
/// and it is responsible for all login functionality.
class DerivAuthCubit extends Cubit<DerivAuthState> implements DerivAuthIO {
  /// Initialize a [DerivAuthCubit].
  DerivAuthCubit({required this.authService}) : super(DerivAuthLoadingState());

  /// [BaseAuthService] handles all login logic of cubit.
  final BaseAuthService authService;

  bool _isUserMigrated = false;

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
      false,
    );
  }

  @override
  Future<void> socialLogin({
    required String oneAllConnectionToken,
    final String? signupProvider,
    String? otp,
  }) async {
    emit(DerivAuthLoadingState());

    await _loginRequest(
      GetTokensRequestModel(
        type: AuthType.social,
        oneAllConnectionToken: oneAllConnectionToken,
        signupProvider: signupProvider,
        otp: otp,
      ),
      true,
    );
  }

  @override
  Future<void> socialAuth({
    required SocialAuthDto socialAuthDto,
    String? otp,
  }) async {
    emit(DerivAuthLoadingState());

    await _loginRequest(
      GetTokensRequestModel(
        type: AuthType.socialLogin,
        socialAuthDto: socialAuthDto,
        otp: otp,
      ),
      true,
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

  Future<void> _loginRequest(
      GetTokensRequestModel request, bool isSocialLogin) async {
    try {
      final AuthorizeEntity authorizeEntity =
          await authService.onLoginRequest(request);
      final LandingCompanyEntity landingCompanyEntity =
          await authService.getLandingCompany(authorizeEntity.country);
      _isUserMigrated = _checkUserMigrated(authorizeEntity);
      emit(DerivAuthLoggedInState(
        DerivAuthModel(
          authorizeEntity: authorizeEntity,
          landingCompany: landingCompanyEntity,
        ),
      ));
    } on DerivAuthException catch (error) {
      emit(DerivAuthErrorState(
        message: error.message,
        type: error.type,
        isSocialLogin: isSocialLogin,
      ));
    }
  }

  Future<void> _tokenLoginRequest(
    String token, {
    required List<AccountModel> accounts,
  }) async {
    try {
      final AuthorizeEntity authorizeEntity =
          await authService.login(token, accounts: accounts);
      final LandingCompanyEntity landingCompanyEntity =
          await authService.getLandingCompany(authorizeEntity.country);
      _isUserMigrated = _checkUserMigrated(authorizeEntity);
      emit(DerivAuthLoggedInState(
        DerivAuthModel(
          authorizeEntity: authorizeEntity,
          landingCompany: landingCompanyEntity,
        ),
      ));
    } on DerivAuthException catch (error) {
      emit(DerivAuthErrorState(
        message: error.message,
        type: error.type,
        isSocialLogin: false,
      ));
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
    if (state is DerivAuthLoggedOutState) {
      return;
    }

    emit(DerivAuthLoadingState());

    try {
      await authService.logout();
      await authService.onLogout();

      emit(DerivAuthLoggedOutState());
      await authService.onPostLogout();
    } on Exception catch (_) {
      emit(DerivAuthLoggedOutState());
    }
  }

  /// Indicates if the user is migrated to wallets or not.
  ///
  /// The user is considered  migrated if at least one of their accounts
  /// is [AccountCategoryEnum.wallet]
  bool get isMigratedToWallets => _isUserMigrated;

  bool _checkUserMigrated(AuthorizeEntity authorizeEntity) =>
      authorizeEntity.accountList?.any(
              (AccountListItem account) =>
          account.accountCategory == AccountCategoryEnum.wallet) ??
          false;

  @override
  Stream<DerivAuthState> get output => stream;
}
