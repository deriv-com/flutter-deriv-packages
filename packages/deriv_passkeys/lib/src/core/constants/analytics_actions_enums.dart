/// The list of actions that can be performed on the Effortless page.
enum EffortlessPageActions {
  /// The user opened the effortless login page.
  openEffortlessLoginPage,

  /// The user closed the effortless login page.
  closeEffortlessLoginPage,

  /// The user pressed the maybe later button.
  maybeLater,
}

/// The list of actions that can be performed on the Learn more page.
enum LearnMorePageActions {
  /// The user opened the learn more page.
  openLearnMorePage,

  /// The user closed the learn more page.
  closeLearnMorePage,
}

/// The list of actions that can be performed on the Create passkey page.
enum CreatePasskeyFlowActions {
  /// The user pressed the create passkey button.
  createPasskey,

  /// Create passkey success.
  createPasskeySuccess,

  /// The user faces an error.
  error,

  /// The user presses the continue trading button.
  continueTrading,

  /// The user presses the add more passkeys button.
  addMorePasskeys,
}

/// The list of actions that can be performed on the Rename passkey page.
enum RenamePasskeyFlowActions {
  /// The user presses the rename passkey button.
  renamePasskey,

  /// The user cancels rename passkey.
  cancelRenamePasskey,

  /// Rename passkey success.
  renamePasskeySuccess,
}

/// The list of actions that can be performed on the Manage Passkeys page.
enum ManagePasskeysPageActions {
  /// The user opened the manage passkeys page.
  openManagePasskeysPage,

  /// The user closed the manage passkeys page.
  closeManagePasskeysPage,
}
