part of 'reset_password_cubit.dart';

/// Reset pass State.
abstract class DerivResetPassState {
  /// Initializes Reset pass State.
  const DerivResetPassState();
}

///  Reset pass initial State.
class DerivResetPassInitialState extends DerivResetPassState {
  /// Initializes Reset pass initial State.
  const DerivResetPassInitialState();
}

/// Reset pass email sent State.
class DerivResetPassEmailSentState extends DerivResetPassState {
  /// Initializes Reset pass email sent State.
  const DerivResetPassEmailSentState();
}

/// Reset pass password changed State.
class DerivResetPassPasswordChangedState extends DerivResetPassState {
  /// Initializes Reset pass password changed State.
  const DerivResetPassPasswordChangedState();
}

/// Reset pass error State.
class DerivResetPassErrorState extends DerivResetPassState {
  /// Initializes Reset pass error State.
  const DerivResetPassErrorState({
    this.errorMessage,
  });

  /// Error message.
  final String? errorMessage;
}
