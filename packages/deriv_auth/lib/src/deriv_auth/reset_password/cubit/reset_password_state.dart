part of 'reset_password_cubit.dart';

/// Reset pass State.
abstract class ResetPassState {
  /// Initializes Reset pass State.
  const ResetPassState();
}

///  Reset pass initial State.
class ResetPassInitialState extends ResetPassState {
  /// Initializes Reset pass initial State.
  const ResetPassInitialState();
}

/// Reset pass email sent State.
class ResetPassEmailSentState extends ResetPassState {
  /// Initializes Reset pass email sent State.
  const ResetPassEmailSentState();
}

/// Reset pass email verified State.
class ResetPassEmailVerifiedState extends ResetPassState {
  /// Initializes Reset pass email verified State.
  const ResetPassEmailVerifiedState({
    required this.token,
  });

  /// Email verification token.
  final String token;
}

/// Reset pass password changed State.
class ResetPassPasswordChangedState extends ResetPassState {
  /// Initializes Reset pass password changed State.
  const ResetPassPasswordChangedState();
}

/// Reset pass error State.
class ResetPassErrorState extends ResetPassState {
  /// Initializes Reset pass error State.
  const ResetPassErrorState({
    required this.errorMessage,
  });

  /// Error message.
  final String? errorMessage;
}
