part of 'deriv_passkeys_bloc.dart';

/// [DerivPasskeysEvent] represents the events within the DerivPasskeys flow.
sealed class DerivPasskeysEvent extends Equatable {
  /// Creates a [DerivPasskeysEvent].
  const DerivPasskeysEvent();

  @override
  List<Object> get props => <Object>[];
}

/// [DerivPasskeysInit] represents the init event within the DerivPasskeys flow.
final class DerivPasskeysInit extends DerivPasskeysEvent {
  /// Creates a [DerivPasskeysInit].
  const DerivPasskeysInit();

  @override
  List<Object> get props => <Object>[];
}

/// [DerivPasskeysCreateCredential] represents the create credential event within the DerivPasskeys flow.
final class DerivPasskeysCreateCredential extends DerivPasskeysEvent {
  /// Creates a [DerivPasskeysCreateCredential].
  const DerivPasskeysCreateCredential(this.options);

  /// The options to create a credential.
  final String options;

  @override
  List<Object> get props => <Object>[options];
}

/// [DerivPasskeysGetCredential] represents the get credential event within the DerivPasskeys flow.
final class DerivPasskeysGetCredential extends DerivPasskeysEvent {}

/// [DerivPasskeysGetPasskeysList] represents the get passkeys list event within the DerivPasskeys flow.
final class DerivPasskeysGetPasskeysList extends DerivPasskeysEvent {
  /// Creates a [DerivPasskeysGetPasskeysList].
  const DerivPasskeysGetPasskeysList(this.options);

  /// The options to get a passkeys list.
  final String options;

  @override
  List<Object> get props => <Object>[options];
}

/// [DerivPasskeysRevokeCredential] represents the revoke credential event within the DerivPasskeys flow.
final class DerivPasskeysRevokeCredential extends DerivPasskeysEvent {
  /// Creates a [DerivPasskeysRevokeCredential].
  const DerivPasskeysRevokeCredential(this.options);

  /// The options to revoke a credential.
  final String options;

  @override
  List<Object> get props => <Object>[options];
}

/// [DerivPasskeysEditCredential] represents the edit credential event within the DerivPasskeys flow.
final class DerivPasskeysEditCredential extends DerivPasskeysEvent {
  /// Creates a [DerivPasskeysEditCredential].
  const DerivPasskeysEditCredential(this.options);

  /// The options to edit a credential.
  final String options;

  @override
  List<Object> get props => <Object>[options];
}
