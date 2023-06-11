import 'package:deriv_auth/core/connection_info.dart';
import 'package:deriv_auth/core/constants/constants.dart';
import 'package:deriv_auth/core/exceptions/deriv_auth_exception.dart';
import 'package:deriv_auth/core/extensions/extensions.dart';
import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/auth_error/auth_error.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:deriv_auth/core/services/jwt/services/base_jwt_service.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/services/token/services/base_token_service.dart';
import 'package:deriv_auth/features/auth/repository/base_auth_repository.dart';
import 'package:deriv_auth/features/auth/services/base_auth_service.dart';

/// `DerivGO` implementation of [BaseAuthService].
class ExampleAuthService extends BaseAuthService {
  /// Initializes a [ExampleAuthService] class.
  ExampleAuthService({
    required this.authRepository,
    required this.jwtService,
    required this.connectionInfo,
    required this.tokenService,
  });

  /// Client connection info.
  final AuthConnectionInfo connectionInfo;

  /// Interface for all jwtRelated functions.
  final BaseJwtService jwtService;

  /// Interface of all client related functions.
  final BaseAuthRepository authRepository;

  /// Token service.
  final BaseTokenService tokenService;

  @override
  Future<AuthorizeEntity> onLoginRequest(
    GetTokensRequestModel request, [
    Function? onInvalidJwtToken,
  ]) async {
    return const AuthorizeEntity();
  }

  @override
  Future<AuthorizeEntity> login(
    String token, {
    required List<AccountModel> accounts,
    String? signupProvider,
    String? refreshToken,
  }) async {
    return const AuthorizeEntity();
  }

  @override
  Future<AccountModel?> getDefaultAccount() =>
      authRepository.getDefaultAccount();

  @override
  Future<List<AccountModel>> getLatestAccounts() =>
      authRepository.getLatestAccounts();

  @override
  Future<void> logout() => authRepository.logout();

  @override
  Future<void> onLogout() => authRepository.onLogout();

  @override
  Future<void> onPostLogout() => authRepository.onPostLogout();

  List<AccountModel> _filterSupportedAccounts(List<AccountModel> accounts) {
    final List<AccountModel> supportedAccounts =
        accounts.where((AccountModel account) => account.isSupported).toList();

    if (supportedAccounts.isEmpty) {
      throw DerivAuthException(
        message: notAvailableCountryMessage,
        type: AuthErrorType.unsupportedCountry,
      );
    }

    return supportedAccounts;
  }
}
