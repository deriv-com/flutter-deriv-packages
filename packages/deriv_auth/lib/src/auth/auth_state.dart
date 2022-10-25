part of 'auth_cubit.dart';

/// Authentication states
abstract class AuthState extends Equatable {
  /// Initializes Authentication states
  const AuthState();

  @override
  List<Object?> get props => <Object?>[];
}

/// Initial state
class AuthInitialState extends AuthState {
  /// Initializes Initial state
  const AuthInitialState();
}

/// LoggedIn state
///
/// Emits when the user login to the app or whenever the user changes
/// his account.
class AuthLoggedInState extends AuthState {
  /// Initializes LoggedIn state
  const AuthLoggedInState({this.authorizedAccount});

  /// Default user account.
  final Authorize? authorizedAccount;
}

/// LoggedOut state
class AuthLoggedOutState extends AuthState {
  /// Initializes LoggedOut state
  const AuthLoggedOutState({this.reason});

  /// Reason for logout, usually needed when logout is forced
  final String? reason;

  @override
  List<Object?> get props => <Object?>[reason];

  @override
  String toString() => 'AuthLoggedOutState(reason: $reason)';
}

/// Logging out in progress state
class AuthLoggingOutState extends AuthState {
  /// Initializes Logging out state
  const AuthLoggingOutState();
}

/// Authentication Error state
class AuthErrorState extends AuthState {
  /// Initializes Authentication Error state
  const AuthErrorState({
    this.errorMessage,
    this.authError,
  });

  /// Error message
  final String? errorMessage;

  /// Error type
  final AuthErrorType? authError;

  @override
  List<Object?> get props => <Object?>[errorMessage, authError];

  @override
  String toString() =>
      'AuthErrorState(errorMessage: $errorMessage, authError: $authError)';
}

/// Connectivity status state
class AuthConnectivityState extends AuthState {
  /// Initializes Connectivity status state
  const AuthConnectivityState({required this.isConnected});

  /// Status of connectivity
  final bool isConnected;

  @override
  List<Object?> get props => <Object?>[isConnected];

  @override
  String toString() => 'AuthConnectivityState(isConnected: $isConnected)';
}
