part of 'deriv_passkeys_bloc.dart';

/// [DerivPasskeysState] represents the state within the DerivPasskeys flow.
abstract class DerivPasskeysState extends Equatable {
  /// Creates a [DerivPasskeysState].
  const DerivPasskeysState();

  @override
  List<Object> get props => <Object>[];
}

/// [DerivPasskeysInitial] represents the initial state within the DerivPasskeys flow.
class DerivPasskeysInitial extends DerivPasskeysState {}

/// [DerivPasskeysLoaded] represents the loaded state within the DerivPasskeys flow.
class DerivPasskeysLoaded extends DerivPasskeysState {
  /// Creates a [DerivPasskeysLoaded].
  const DerivPasskeysLoaded(this.passkeysList);

  /// The passkeys list.
  final List<DerivPasskeyEntity> passkeysList;

  @override
  List<Object> get props => <Object>[passkeysList];
}

/// [DerivPasskeysLoading] represents the loading state within the DerivPasskeys flow.
class DerivPasskeysLoading extends DerivPasskeysState {}

/// [DerivPasskeysCreatedSuccessfully] represents the created successfully state within the DerivPasskeys flow.
class DerivPasskeysCreatedSuccessfully extends DerivPasskeysState {}

/// [DerivPasskeysNotSupported] represents the not supported state within the DerivPasskeys flow.
class DerivPasskeysNotSupported extends DerivPasskeysState {}

/// [DerivPasskeysError] represents the error state within the DerivPasskeys flow.
class DerivPasskeysError extends DerivPasskeysState {
  /// Creates a [DerivPasskeysError].
  const DerivPasskeysError(this.message);

  /// The error message.
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
