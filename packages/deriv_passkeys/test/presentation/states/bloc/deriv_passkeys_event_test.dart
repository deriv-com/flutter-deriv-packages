import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DerivPasskeysCreateCredentialEvent', () {
    test('props should be empty', () {
      final DerivPasskeysEvent event = DerivPasskeysCreateCredentialEvent();

      expect(event.props, isEmpty);
    });
  });

  group('DerivPasskeysVerifyCredentialEvent', () {
    test('props should be empty', () {
      final DerivPasskeysEvent event = DerivPasskeysVerifyCredentialEvent();

      expect(event.props, isEmpty);
    });
  });

  group('DerivPasskeysGetPasskeysListEvent', () {
    test('props should be empty', () {
      const DerivPasskeysEvent event = DerivPasskeysGetPasskeysListEvent();

      expect(event.props, isEmpty);
    });
  });

  group('SetDerivPasskeysInitializedEvent', () {
    test('props should be empty', () {
      const DerivPasskeysEvent event = SetDerivPasskeysInitializedEvent();

      expect(event.props, isEmpty);
    });
  });

  group('SetDerivPasskeysNotSupportedEvent', () {
    test('props should be empty', () {
      const DerivPasskeysEvent event = SetDerivPasskeysNotSupportedEvent();

      expect(event.props, isEmpty);
    });
  });

  group('DerivPasskeysRevokeCredentialEvent', () {
    test('props should contain options', () {
      const String options = 'revoke_options';
      const DerivPasskeysEvent event =
          DerivPasskeysRevokeCredentialEvent(options);

      expect(event.props, <String>[options]);
    });
  });

  group('DerivPasskeysEditCredentialEvent', () {
    test('props should contain options', () {
      const String options = 'edit_options';
      const DerivPasskeysEvent event =
          DerivPasskeysEditCredentialEvent(options);

      expect(event.props, <String>[options]);
    });
  });
}
