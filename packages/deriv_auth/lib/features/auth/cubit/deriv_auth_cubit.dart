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
    String? userAgent,
  }) async {
    emit(DerivAuthLoadingState());

    await _loginRequest(
      request: GetTokensRequestModel(
        type: AuthType.system,
        email: email,
        password: password,
        otp: otp,
      ),
      isSocialLogin: false,
      userAgent: userAgent,
    );
  }

  @override
  Future<void> socialLogin({
    required String oneAllConnectionToken,
    final String? signupProvider,
    String? otp,
    String? userAgent,
  }) async {
    emit(DerivAuthLoadingState());

    await _loginRequest(
      request: GetTokensRequestModel(
        type: AuthType.social,
        oneAllConnectionToken: oneAllConnectionToken,
        signupProvider: signupProvider,
        otp: otp,
      ),
      isSocialLogin: true,
      userAgent: userAgent,
    );
  }

  @override
  Future<void> socialAuth({
    required SocialAuthDto socialAuthDto,
    String? otp,
    String? userAgent,
  }) async {
    emit(DerivAuthLoadingState());

    await _loginRequest(
      request: GetTokensRequestModel(
        type: AuthType.socialLogin,
        socialAuthDto: socialAuthDto,
        otp: otp,
      ),
      isSocialLogin: true,
      userAgent: userAgent,
    );
  }

  @override
  Future<void> tokenLogin(String token, {List<String>? tokenList}) async {
    emit(DerivAuthLoadingState());
    List<String> accountTokens = <String>[];
    if (tokenList == null) {
      final List<AccountModel> accountList =
          await authService.getLatestAccounts();
      accountTokens = accountList
          .where((AccountModel account) =>
              account.token != null && token != account.token)
          .map((AccountModel account) => account.token!)
          .toList();
    } else {
      accountTokens = tokenList;
    }
    await _tokenLoginRequest(
      token,
      tokenList: accountTokens,
      accounts: await authService.getLatestAccounts(),
    );
  }

  Future<void> _loginRequest({
    required GetTokensRequestModel request,
    required bool isSocialLogin,
    String? userAgent,
  }) async {
    try {
      final AuthorizeEntity authorizeEntity = await authService.onLoginRequest(
        request: request,
        userAgent: userAgent,
      );

      ///TODO (John): Check if this has to be reset for every account change
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
    List<String>? tokenList,
  }) async {
    try {
      final AuthorizeEntity authorizeEntity = await authService.login(token,
          accounts: accounts, tokenList: tokenList);
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

    List<String> tokenList = <String>[];
    final List<AccountModel> accountList =
        await authService.getLatestAccounts();
    final String? defaultAccountToken =
        (await authService.getDefaultAccount())?.token;

    if (defaultAccountToken == null) {
      emit(DerivAuthLoggedOutState());

      return;
    } else {
      tokenList = accountList
          .where((AccountModel account) =>
              account.token != null && defaultAccountToken != account.token)
          .map((AccountModel account) => account.token!)
          .toList();
    }

    await _tokenLoginRequest(
      defaultAccountToken,
      accounts: accountList,
      tokenList: tokenList,
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
      authorizeEntity.accountList?.any((AccountListItem account) =>
          account.accountCategory == AccountCategoryEnum.wallet) ??
      false;

  @override
  Stream<DerivAuthState> get output => stream;
}
