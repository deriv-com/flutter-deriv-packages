part of 'deriv_auth_cubit.dart';

/// Authentication states
abstract class DerivAuthState {}

/// Authentication in progress state.
class DerivAuthLoadingState extends DerivAuthState {}

/// Logged in state.
///
/// Holds the [AuthorizeEntity] of the user so it
/// can be accessed by the client.
class DerivAuthLoggedInState extends DerivAuthState {
  /// Initialize [DerivAuthLoggedInState].
  DerivAuthLoggedInState({
    required this.authorizeEntity,
    required this.landingCompany,
  });

  /// [AuthorizeEntity] hold all user information.
  final AuthorizeEntity authorizeEntity;

  /// [LandingCompanyEntity] hold all landing company information.
  final LandingCompanyEntity landingCompany;

  /// Indicates if the user is migrated to wallets or not.
  bool get isMigratedToWallets =>
      authorizeEntity.linkedTo?.isNotEmpty ?? false;
}

/// Logged out state.
class DerivAuthLoggedOutState extends DerivAuthState {}

/// Authentication Error state.
class DerivAuthErrorState extends DerivAuthState {
  /// Initialize [DerivAuthErrorState].
  DerivAuthErrorState({
    required this.message,
    required this.type,
  });

  /// Error message.
  final String message;

  /// Error type.
  final AuthErrorType type;
}
