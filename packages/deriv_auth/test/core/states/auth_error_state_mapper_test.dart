import 'package:deriv_auth/core/states/states.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:deriv_auth/deriv_auth.dart';

class MockBuildContext extends Mock implements BuildContext {}

// Create a mock implementation of AuthErrorStateHandler for testing.
final class MockAuthErrorStateHandler extends AuthErrorStateHandler {
  MockAuthErrorStateHandler({required super.context});

  DerivAuthErrorState? lastHandledError;

  @override
  void onMissingOtp(DerivAuthErrorState errorState) {
    lastHandledError = errorState;
  }

  @override
  void onSelfClosed(DerivAuthErrorState errorState) {
    lastHandledError = errorState;
  }

  @override
  void onUnsupportedCountry(DerivAuthErrorState errorState) {
    lastHandledError = errorState;
  }

  @override
  void onAccountUnavailable(DerivAuthErrorState errorState) {
    lastHandledError = errorState;
  }

  @override
  void onInvalidCredentials(DerivAuthErrorState errorState) {
    lastHandledError = errorState;
  }

  @override
  void onFailedAuthorization(DerivAuthErrorState errorState) {
    lastHandledError = errorState;
  }

  @override
  void onInvalidResidence(DerivAuthErrorState errorState) {
    lastHandledError = errorState;
  }

  @override
  void onExpiredAccount(DerivAuthErrorState errorState) {
    lastHandledError = errorState;
  }

  @override
  void invalid2faCode(DerivAuthErrorState errorState) {
    lastHandledError = errorState;
  }

  @override
  void onConnectionError(DerivAuthErrorState errorState) {
    lastHandledError = errorState;
  }

  @override
  void onSwitchAccountError(DerivAuthErrorState errorState) {
    lastHandledError = errorState;
  }
}

void main() {
  // Create an instance of MockAuthErrorStateHandler for testing.
  final MockAuthErrorStateHandler mockHandler = MockAuthErrorStateHandler(
    context: MockBuildContext(),
  );

  test('authErrorStateMapper handles missing OTP', () {
    final DerivAuthErrorState errorState = DerivAuthErrorState(
        type: AuthErrorType.missingOtp, isSocialLogin: false, message: '');
    authErrorStateMapper(
      authErrorState: errorState,
      authErrorStateHandler: mockHandler,
    );

    expect(mockHandler.lastHandledError, equals(errorState));
  });

  test('authErrorStateMapper handles self closed', () {
    final DerivAuthErrorState errorState = DerivAuthErrorState(
        type: AuthErrorType.selfClosed, isSocialLogin: false, message: '');
    authErrorStateMapper(
      authErrorState: errorState,
      authErrorStateHandler: mockHandler,
    );

    expect(mockHandler.lastHandledError, equals(errorState));
  });

  test('authErrorStateMapper handles unsupported country', () {
    final DerivAuthErrorState errorState = DerivAuthErrorState(
        type: AuthErrorType.unsupportedCountry,
        isSocialLogin: false,
        message: '');
    authErrorStateMapper(
      authErrorState: errorState,
      authErrorStateHandler: mockHandler,
    );

    expect(mockHandler.lastHandledError, equals(errorState));
  });

  test('authErrorStateMapper handles account unavailable', () {
    final DerivAuthErrorState errorState = DerivAuthErrorState(
        type: AuthErrorType.accountUnavailable,
        isSocialLogin: false,
        message: '');
    authErrorStateMapper(
      authErrorState: errorState,
      authErrorStateHandler: mockHandler,
    );

    expect(mockHandler.lastHandledError, equals(errorState));
  });

  test('authErrorStateMapper handles invalid credentials', () {
    final DerivAuthErrorState errorState = DerivAuthErrorState(
        type: AuthErrorType.invalidCredential,
        isSocialLogin: false,
        message: '');
    authErrorStateMapper(
      authErrorState: errorState,
      authErrorStateHandler: mockHandler,
    );

    expect(mockHandler.lastHandledError, equals(errorState));
  });

  test('authErrorStateMapper handles failed authorization', () {
    final DerivAuthErrorState errorState = DerivAuthErrorState(
        type: AuthErrorType.failedAuthorization,
        isSocialLogin: false,
        message: '');
    authErrorStateMapper(
      authErrorState: errorState,
      authErrorStateHandler: mockHandler,
    );

    expect(mockHandler.lastHandledError, equals(errorState));
  });

  test('authErrorStateMapper handles invalid residence', () {
    final DerivAuthErrorState errorState = DerivAuthErrorState(
        type: AuthErrorType.invalidResidence,
        isSocialLogin: false,
        message: '');
    authErrorStateMapper(
      authErrorState: errorState,
      authErrorStateHandler: mockHandler,
    );

    expect(mockHandler.lastHandledError, equals(errorState));
  });

  test('authErrorStateMapper handles expired account', () {
    final DerivAuthErrorState errorState = DerivAuthErrorState(
        type: AuthErrorType.expiredAccount, isSocialLogin: false, message: '');
    authErrorStateMapper(
      authErrorState: errorState,
      authErrorStateHandler: mockHandler,
    );

    expect(mockHandler.lastHandledError, equals(errorState));
  });

  test('authErrorStateMapper handles invalid 2FA code', () {
    final DerivAuthErrorState errorState = DerivAuthErrorState(
        type: AuthErrorType.invalid2faCode, isSocialLogin: false, message: '');
    authErrorStateMapper(
      authErrorState: errorState,
      authErrorStateHandler: mockHandler,
    );
    expect(mockHandler.lastHandledError, equals(errorState));
  });

  test('authErrorStateMapper handles connection error', () {
    final DerivAuthErrorState errorState = DerivAuthErrorState(
        type: AuthErrorType.connectionError, isSocialLogin: false, message: '');
    authErrorStateMapper(
      authErrorState: errorState,
      authErrorStateHandler: mockHandler,
    );
    expect(mockHandler.lastHandledError, equals(errorState));
  });

  test('authErrorStateMapper handles switch account error', () {
    final DerivAuthErrorState errorState = DerivAuthErrorState(
        type: AuthErrorType.switchAccountError,
        isSocialLogin: false,
        message: '');
    authErrorStateMapper(
      authErrorState: errorState,
      authErrorStateHandler: mockHandler,
    );
    expect(mockHandler.lastHandledError, equals(errorState));
  });
}
