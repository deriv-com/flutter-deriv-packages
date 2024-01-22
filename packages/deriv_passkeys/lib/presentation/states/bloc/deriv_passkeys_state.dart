part of 'deriv_passkeys_bloc.dart';

/// [DerivPasskeysState] represents the state within the DerivPasskeys flow.
sealed class DerivPasskeysState extends Equatable {
  /// Creates a [DerivPasskeysState].
  const DerivPasskeysState();

  @override
  List<Object> get props => <Object>[];
}

/// [DerivPasskeysInitial] represents the initial state within the DerivPasskeys flow.
final class DerivPasskeysInitial extends DerivPasskeysState {}

/// [DerivPasskeysLoaded] represents the loaded state within the DerivPasskeys flow.
final class DerivPasskeysLoaded extends DerivPasskeysState {
  /// Creates a [DerivPasskeysLoaded].
  const DerivPasskeysLoaded(this.passkeysList);

  /// The passkeys list.
  final String passkeysList;

  @override
  List<Object> get props => <Object>[passkeysList];
}

/// [DerivPasskeysLoading] represents the loading state within the DerivPasskeys flow.
final class DerivPasskeysLoading extends DerivPasskeysState {}

/// [DerivPasskeysNotSupported] represents the not supported state within the DerivPasskeys flow.
final class DerivPasskeysNotSupported extends DerivPasskeysState {}

/// [DerivPasskeysError] represents the error state within the DerivPasskeys flow.
final class DerivPasskeysError extends DerivPasskeysState {
  /// Creates a [DerivPasskeysError].
  const DerivPasskeysError(this.message);

  /// The error message.
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
