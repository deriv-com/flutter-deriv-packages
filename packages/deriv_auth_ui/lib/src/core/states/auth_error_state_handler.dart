import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth_ui/src/core/extensions/context_extension.dart';
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
      errorMessage: context.localization.informInvalid2FACode,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// On account is not activated.
  void onAccountUnavailable(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informDeactivatedAccount,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// On expired account.
  void onExpiredAccount(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informExpiredAccount,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// On failed authorization.
  void onFailedAuthorization(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informFailedAuthorization,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// User is trying to authenticate from an unsupported residence.
  void onInavlidResidence(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informInvalidResidence,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// On invalid credentials.
  void onInvalidCredentials(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informInvalidCredentials,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// User has set up 2FA and needs to enter 2FA.
  void onMissingOtp(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informMissingOtp,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// On self closed account.
  void onSelfClosed(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informSelfClosed,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// On unexpected error.
  void onUnexpectedError(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informUnexpectedError,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// Account is not supported in the country.
  void onUnsupportedCountry(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informUnsupportedCountry,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// On connection error.
  void onConnectionError(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informConnectionError,
      actionLabel: context.localization.actionTryAgain,
    );
  }

  /// On switch account error.
  void onSwitchAccountError(DerivAuthErrorState state) {
    showErrorDialog(
      context: context,
      errorMessage: context.localization.informSwitchAccountError,
      actionLabel: context.localization.actionTryAgain,
    );
  }
}
