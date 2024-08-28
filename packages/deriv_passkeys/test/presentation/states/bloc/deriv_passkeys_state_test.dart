import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_passkeys/src/domain/entities/account_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DerivPasskeysLoadedState', () {
    test('props should contain passkeysList', () {
      final List<DerivPasskeyEntity> passkeysList = <DerivPasskeyEntity>[];
      final DerivPasskeysState state = DerivPasskeysLoadedState(passkeysList);
      expect(state.props, contains(passkeysList));
    });
  });

  group('DerivPasskeysInitializedState', () {
    test('props should be empty', () {
      final DerivPasskeysState state = DerivPasskeysInitializedState();
      expect(state.props, isEmpty);
    });
  });

  group('DerivPasskeysLoadingState', () {
    test('props should be empty', () {
      final DerivPasskeysState state = DerivPasskeysLoadingState();
      expect(state.props, isEmpty);
    });
  });

  group('DerivPasskeysCreatedSuccessfullyState', () {
    test('props should be empty', () {
      final DerivPasskeysState state = DerivPasskeysCreatedSuccessfullyState();
      expect(state.props, isEmpty);
    });
  });

  group('DerivPasskeysCredentialVerifiedState', () {
    test('props should contain token', () {
      const String token = 'example_token';
      const String refreshToken = 'example_refresh_token';
      const DerivPasskeysState state = DerivPasskeysCredentialVerifiedState(
        accounts: <AccountEntity>[
          AccountEntity(loginId: 'example_login_id', token: token),
        ],
        refreshToken: refreshToken,
      );
      expect(
          state.props,
          containsAll(<Object?>[
            <AccountEntity>[
              const AccountEntity(loginId: 'example_login_id', token: token),
            ],
            refreshToken
          ]));
    });
  });

  group('DerivPasskeysNotSupportedState', () {
    test('props should be empty', () {
      final DerivPasskeysState state = DerivPasskeysNotSupportedState();
      expect(state.props, isEmpty);
    });
  });

  group('DerivPasskeysErrorState', () {
    test('props should contain message and errorCode', () {
      const String message = 'example_message';
      const String errorCode = 'example_error_code';
      const DerivPasskeysState state =
          DerivPasskeysErrorState(message, errorCode: errorCode);
      expect(state.props, containsAll(<Object?>[message, errorCode]));
    });
  });

  group('NoCredentialErrorState', () {
    test('props should contain message and errorCode', () {
      const NoCredentialErrorState state = NoCredentialErrorState();
      expect(state.props, contains('No credential found'));
    });
  });
}
