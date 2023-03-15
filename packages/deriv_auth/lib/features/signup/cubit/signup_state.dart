part of 'signup_cubit.dart';

/// Sign up state
abstract class DerivSignupState {
  /// Initialize DerivSignup state
  const DerivSignupState();
}

/// Initial state.
class DerivSignupInitialState extends DerivSignupState {
  /// Initialize initial state.
  const DerivSignupInitialState();
}

/// Sign up in progress state.
class DerivSignupProgressState extends DerivSignupState {
  /// Initialize progress state.
  const DerivSignupProgressState();
}

/// Sign up done state.
class DerivSignupEmailSentState extends DerivSignupState {
  /// Initialize done state.
  const DerivSignupEmailSentState();
}

/// Sign up done state.
class DerivSignupDoneState extends DerivSignupState {
  /// Initialize done state.
  const DerivSignupDoneState({required this.account});

  /// Details of new virtual account created.
  final AccountModel? account;
}

/// Sign up error state.
class DerivSignupErrorState extends DerivSignupState {
  /// Initialize error state.
  const DerivSignupErrorState(this.errorMessage, {this.type});

  /// Error message.
  final String errorMessage;

  /// Error type.
  final SignupErrorType? type;
}
