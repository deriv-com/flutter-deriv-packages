import 'package:deriv_localizations/l10n/generated/deriv_passkeys/deriv_passkeys_localizations.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/presentation/widgets/passkey_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PasskeyWidget', () {
    const DerivPasskeyEntity passkey = DerivPasskeyEntity(
      storedOn: 'Device',
      lastUsed: 1638297600000,
      createdAt: 1638297600000,
      id: '',
      name: 'Passkey',
      passkeyId: '',
    );

    testWidgets('should display passkey information',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DerivPasskeysLocalizations.delegate,
          ],
          locale: Locale('en'),
          home: Scaffold(
            body: PasskeyWidget(passkey: passkey),
          ),
        ),
      );

      expect(find.text('Passkey'), findsOneWidget);
      expect(find.textContaining('Device'), findsOneWidget);
      expect(find.textContaining('November 30th, 2021'), findsOneWidget);
    });
  });
}
