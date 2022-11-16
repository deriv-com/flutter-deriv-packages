part of 'signup_cubit.dart';

/// Sign up state
abstract class SignupState {
  /// Initialise signup state
  const SignupState();
}

/// Initial state.
class SignupInitialState extends SignupState {
  /// Initialises initial state.
  const SignupInitialState();
}

/// Sign up in progress state.
class SignupProgressState extends SignupState {
  /// Initialises progress state.
  const SignupProgressState();
}

/// Sign up done state.
class SignupDoneState extends SignupState {
  /// Initialises done state.
  const SignupDoneState();
}

/// Sign up error state.
class SignupErrorState extends SignupState {
  /// Initialises error state.
  const SignupErrorState(this.errorMessage);

  /// Error message
  final String errorMessage;
}
