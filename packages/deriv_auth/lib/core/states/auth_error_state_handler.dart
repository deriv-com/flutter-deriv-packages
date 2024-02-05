import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

/// {@template default_auth_error_state_handler}
/// Base class for handling [DerivAuthErrorState]s. Client app can extend this
/// class and override the methods to handle the error states based on their
/// customization. This handler is to make sure each and every error state is
/// handled.
/// {@endtemplate}
base class AuthErrorStateHandler {
  /// {@macro default_auth_error_state_handler}
  AuthErrorStateHandler({
    required this.context,
  });

  /// The [BuildContext] of the widget that is using this handler.
  final BuildContext context;

  void _showDialog(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: state.message,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// On invalid 2FA code.
  void invalid2faCode(DerivAuthErrorState state) {
    _showDialog(state);
  }

  /// On account is not activated.
  void onAccountUnavailable(DerivAuthErrorState state) {
    _showDialog(state);
  }

  /// On expired account.
  void onExpiredAccount(DerivAuthErrorState state) {
    _showDialog(state);
  }

  /// On failed authorization.
  void onFailedAuthorization(DerivAuthErrorState state) {
    _showDialog(state);
  }

  /// User is trying to authenticate from an unsupported residence.
  void onInavlidResidence(DerivAuthErrorState state) {
    _showDialog(state);
  }

  /// On invalid credentials.
  void onInvalidCredentials(DerivAuthErrorState state) {
    _showDialog(state);
  }

  /// User has set up 2FA and needs to enter 2FA.
  void onMissingOtp(DerivAuthErrorState state) {
    _showDialog(state);
  }

  /// On self closed account.
  void onSelfClosed(DerivAuthErrorState state) {
    _showDialog(state);
  }

  /// On unexpected error.
  void onUnexpectedError(DerivAuthErrorState state) {
    _showDialog(state);
  }

  /// Account is not supported in the country.
  void onUnsupportedCountry(DerivAuthErrorState state) {
    _showDialog(state);
  }

  /// On connection error.
  void onConnectionError(DerivAuthErrorState state) {
    _showDialog(state);
  }

  /// On switch account error.
  void onSwitchAccountError(DerivAuthErrorState state) {
    _showDialog(state);
  }
}
