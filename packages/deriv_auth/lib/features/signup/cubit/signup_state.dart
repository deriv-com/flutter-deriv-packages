part of 'signup_cubit.dart';

/// Sign up state
abstract class DerivSignupState {
  /// Initialise DerivSignup state
  const DerivSignupState();
}

/// Initial state.
class DerivSignupInitialState extends DerivSignupState {
  /// Initialises initial state.
  const DerivSignupInitialState();
}

/// Sign up in progress state.
class DerivSignupProgressState extends DerivSignupState {
  /// Initialises progress state.
  const DerivSignupProgressState();
}

/// Sign up done state.
class DerivSignupEmailSentState extends DerivSignupState {
  /// Initialises done state.
  const DerivSignupEmailSentState();
}

/// Sign up done state.
class DerivSignupDoneState extends DerivSignupState {
  /// Initialises done state.
  const DerivSignupDoneState({required this.account});

  /// Details of new virtual account created.
  final AccountModel? account;
}

/// Sign up error state.
class DerivSignupErrorState extends DerivSignupState {
  /// Initialises error state.
  const DerivSignupErrorState(this.errorMessage);

  /// Error message
  final String errorMessage;
}
