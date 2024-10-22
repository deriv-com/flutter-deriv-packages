part of 'deriv_passkeys_bloc.dart';

/// [DerivPasskeysState] represents the state within the DerivPasskeys flow.
abstract class DerivPasskeysState extends Equatable {
  /// Creates a [DerivPasskeysState].
  const DerivPasskeysState();

  @override
  List<Object?> get props => <Object?>[];
}

/// [DerivPasskeysLoadedState] represents the loaded state within the DerivPasskeys flow.
class DerivPasskeysLoadedState extends DerivPasskeysState {
  /// Creates a [DerivPasskeysLoadedState].
  const DerivPasskeysLoadedState(this.passkeysList);

  /// The passkeys list.
  final List<DerivPasskeyEntity> passkeysList;

  @override
  List<Object> get props => <Object>[passkeysList];
}

/// [DerivPasskeysInitializedState] represents the initialized state within the DerivPasskeys flow.
class DerivPasskeysInitializedState extends DerivPasskeysState {}

/// [DerivPasskeysLoadingState] represents the loading state within the DerivPasskeys flow.
class DerivPasskeysLoadingState extends DerivPasskeysState {}

/// [DerivPasskeysCreatedSuccessfullyState] represents the created successfully state within the DerivPasskeys flow.
class DerivPasskeysCreatedSuccessfullyState extends DerivPasskeysState {}

/// [DerivPasskeysCredentialVerifiedState] represents the credential verified state within the DerivPasskeys flow.
class DerivPasskeysCredentialVerifiedState extends DerivPasskeysState {
  /// Creates a [DerivPasskeysCredentialVerifiedState].
  const DerivPasskeysCredentialVerifiedState({
    required this.accounts,
    required this.refreshToken,
  });

  /// List of accounts from the response.
  final List<AccountEntity> accounts;

  /// Refresh token from the response.
  final String refreshToken;

  @override
  List<Object?> get props => <Object?>[accounts, refreshToken];
}

/// [DerivPasskeysNotSupportedState] represents the not supported state within the DerivPasskeys flow.
class DerivPasskeysNotSupportedState extends DerivPasskeysState {}

/// [DerivPasskeysErrorState] represents the error state within the DerivPasskeys flow.
class DerivPasskeysErrorState extends DerivPasskeysState {
  /// Creates a [DerivPasskeysErrorState].
  const DerivPasskeysErrorState(this.message, {this.errorCode = ''});

  /// The error message.
  final String message;

  /// The error code
  final String errorCode;

  @override
  List<Object> get props => <Object>[message, errorCode];
}

/// [NoCredentialErrorState] represents the no credential error state within the DerivPasskeys flow.
class NoCredentialErrorState extends DerivPasskeysErrorState {
  /// Creates a [NoCredentialErrorState].
  const NoCredentialErrorState() : super('No credential found');
}
