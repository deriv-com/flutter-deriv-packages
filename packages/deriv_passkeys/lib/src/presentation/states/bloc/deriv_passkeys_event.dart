part of 'deriv_passkeys_bloc.dart';

/// [DerivPasskeysEvent] represents the events within the DerivPasskeys flow.
class DerivPasskeysEvent extends Equatable {
  /// Creates a [DerivPasskeysEvent].
  const DerivPasskeysEvent();

  @override
  List<Object> get props => <Object>[];
}

/// [DerivPasskeysCreateCredentialEvent] represents the create credential event within the DerivPasskeys flow.
class DerivPasskeysCreateCredentialEvent extends DerivPasskeysEvent {}

/// [DerivPasskeysVerifyCredentialEvent] represents the get credential event within the DerivPasskeys flow.
class DerivPasskeysVerifyCredentialEvent extends DerivPasskeysEvent {}

/// [DerivPasskeysGetPasskeysListEvent] represents the get passkeys list event within the DerivPasskeys flow.
class DerivPasskeysGetPasskeysListEvent extends DerivPasskeysEvent {
  /// Creates a [DerivPasskeysGetPasskeysListEvent].
  const DerivPasskeysGetPasskeysListEvent({this.loginId});

  /// Default account loginId used for multi-token authorization
  final String? loginId;

  @override
  List<Object> get props => <Object>[];
}

/// [SetDerivPasskeysInitializedEvent] represents the set initialized event within the DerivPasskeys flow.
class SetDerivPasskeysInitializedEvent extends DerivPasskeysEvent {
  /// Creates a [SetDerivPasskeysInitializedEvent].
  const SetDerivPasskeysInitializedEvent();

  @override
  List<Object> get props => <Object>[];
}

/// [SetDerivPasskeysNotSupportedEvent] represents the set not supported event within the DerivPasskeys flow.
class SetDerivPasskeysNotSupportedEvent extends DerivPasskeysEvent {
  /// Creates a [SetDerivPasskeysNotSupportedEvent].
  const SetDerivPasskeysNotSupportedEvent();

  @override
  List<Object> get props => <Object>[];
}

/// [DerivPasskeysRevokeCredentialEvent] represents the revoke credential event within the DerivPasskeys flow.
class DerivPasskeysRevokeCredentialEvent extends DerivPasskeysEvent {
  /// Creates a [DerivPasskeysRevokeCredentialEvent].
  const DerivPasskeysRevokeCredentialEvent(this.options);

  /// The options to revoke a credential.
  final String options;

  @override
  List<Object> get props => <Object>[options];
}

/// [DerivPasskeysEditCredentialEvent] represents the edit credential event within the DerivPasskeys flow.
class DerivPasskeysEditCredentialEvent extends DerivPasskeysEvent {
  /// Creates a [DerivPasskeysEditCredentialEvent].
  const DerivPasskeysEditCredentialEvent(this.options);

  /// The options to edit a credential.
  final String options;

  @override
  List<Object> get props => <Object>[options];
}

/// [DerivPasskeysLogoutEvent] represents the logout event within the DerivPasskeys flow.
class DerivPasskeysLogoutEvent extends DerivPasskeysEvent {}
