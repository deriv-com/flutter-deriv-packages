import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

/// {@template default_auth_error_state_handler}
/// Base class for handling [DerivAuthErrorState]s. Client app can extend this
/// class and override the methods to handle the error states based on their
/// customization.
/// {@endtemplate}
base class AuthErrorStateHandler {
  /// {@macro default_auth_error_state_handler}
  AuthErrorStateHandler({
    required this.context,
  });

  /// The [BuildContext] of the widget that is using this handler.
  final BuildContext context;

  /// On invalid 2FA code.
  void invalid2faCode(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.derivAuthLocalization.informInvalid2FACode,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// On account is not activated.
  void onAccountUnavailable(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.derivAuthLocalization.informDeactivatedAccount,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// On expired account.
  void onExpiredAccount(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.derivAuthLocalization.informExpiredAccount,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// On failed authorization.
  void onFailedAuthorization(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: state.message,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// User is trying to authenticate from an unsupported residence.
  void onInvalidResidence(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.derivAuthLocalization.informInvalidResidence,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// On invalid credentials.
  void onInvalidCredentials(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.derivAuthLocalization.informInvalidCredentials,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// User has set up 2FA and needs to enter 2FA.
  void onMissingOtp(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.derivAuthLocalization.informMissingOtp,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// On self closed account.
  void onSelfClosed(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.derivAuthLocalization.informSelfClosed,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// On unexpected error.
  void onUnexpectedError(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.derivAuthLocalization.informUnexpectedError,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// Account is not supported in the country.
  void onUnsupportedCountry(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.derivAuthLocalization.informUnsupportedCountry,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// On connection error.
  void onConnectionError(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.derivAuthLocalization.informConnectionError,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }

  /// On switch account error.
  void onSwitchAccountError(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.derivAuthLocalization.informSwitchAccountError,
      actionLabel: context.derivAuthLocalization.actionTryAgain,
    );
  }
}
