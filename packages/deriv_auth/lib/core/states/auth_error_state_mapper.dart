import 'package:deriv_auth/core/states/states.dart';
import 'package:deriv_auth/deriv_auth.dart';

/// Maps the [DerivAuthErrorState] to the corresponding [AuthErrorStateHandler].
void authErrorStateMapper({
  required DerivAuthErrorState authErrorState,
  required AuthErrorStateHandler authErrorStateHandler,
  List<AuthErrorType>? ignoredExceptions,
}) {
  if (ignoredExceptions?.contains(authErrorState.type) ?? false) {
    return;
  }
  switch (authErrorState.type) {
    case AuthErrorType.missingOtp:
      authErrorStateHandler.onMissingOtp(authErrorState);
      return;
    case AuthErrorType.selfClosed:
      authErrorStateHandler.onSelfClosed(authErrorState);
      return;
    case AuthErrorType.unsupportedCountry:
      authErrorStateHandler.onUnsupportedCountry(authErrorState);
      return;
    case AuthErrorType.accountUnavailable:
      authErrorStateHandler.onAccountUnavailable(authErrorState);
      return;
    case AuthErrorType.invalidCredential:
      authErrorStateHandler.onInvalidCredentials(authErrorState);
      return;
    case AuthErrorType.invalid2faCode:
      authErrorStateHandler.invalid2faCode(authErrorState);
      return;
    case AuthErrorType.failedAuthorization:
      authErrorStateHandler.onFailedAuthorization(authErrorState);
      return;
    case AuthErrorType.invalidResidence:
      authErrorStateHandler.onInvalidResidence(authErrorState);
      return;
    case AuthErrorType.expiredAccount:
      authErrorStateHandler.onExpiredAccount(authErrorState);
      return;
    case AuthErrorType.connectionError:
      authErrorStateHandler.onConnectionError(authErrorState);
      return;
    case AuthErrorType.switchAccountError:
      authErrorStateHandler.onSwitchAccountError(authErrorState);
      return;
    default:
      authErrorStateHandler.onUnexpectedError(authErrorState);
      return;
  }
}
