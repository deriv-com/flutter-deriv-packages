part of 'new_virtual_account_cubit.dart';

/// New virtual account signup
abstract class NewVirtualAccountState {
  /// Initialise new virtual account state
  const NewVirtualAccountState();
}

/// Initial state.
class NewVirtualAccountInitialState extends NewVirtualAccountState {
  /// Initialises initial state.
  const NewVirtualAccountInitialState();
}

/// API for new virtual account signup is being called.
class NewVirtualAccountProgressState extends NewVirtualAccountState {
  /// Progress state.
  const NewVirtualAccountProgressState();
}

/// API returned success.
class NewVirtualAccountDoneState extends NewVirtualAccountState {
  /// Done state.
  const NewVirtualAccountDoneState(this.newAccount);

  /// Details of new virtual account created.
  final AccountModel? newAccount;
}

/// API returned some error.
class NewVirtualAccountErrorState extends NewVirtualAccountState {
  /// Error state.
  const NewVirtualAccountErrorState(this.message);

  /// Error message.
  final String message;
}
