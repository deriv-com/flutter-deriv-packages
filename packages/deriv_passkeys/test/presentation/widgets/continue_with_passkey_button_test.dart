import 'package:bloc_test/bloc_test.dart';
import 'package:deriv_localizations/l10n/generated/deriv_passkeys/deriv_passkeys_localizations.dart';
import 'package:deriv_localizations/l10n/generated/deriv_passkeys/deriv_passkeys_localizations_en.dart';
import 'package:deriv_passkeys/src/presentation/states/bloc/deriv_passkeys_bloc.dart';
import 'package:deriv_passkeys/src/presentation/widgets/continue_with_passkey_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockDerivPasskeysBloc
    extends MockBloc<DerivPasskeysEvent, DerivPasskeysState>
    implements DerivPasskeysBloc {}

class _TestPage extends StatelessWidget {
  const _TestPage();

  @override
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          DerivPasskeysLocalizations.delegate,
        ],
        locale: const Locale('en'),
        home: Scaffold(
          body: ContinueWithPasskeyButton(
            onTap: () {},
          ),
        ),
      );
}

void main() {
  group('ContinueWithPasskeyButton', () {
    late MockDerivPasskeysBloc derivPasskeysBloc;
    setUp(() {
      derivPasskeysBloc = MockDerivPasskeysBloc();

      when(() => derivPasskeysBloc.state).thenReturn(
        DerivPasskeysInitializedState(),
      );
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider<DerivPasskeysBloc>(
          create: (BuildContext context) => derivPasskeysBloc,
          child: const _TestPage(),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Biometrics'), findsOneWidget);
    });

    testWidgets('does not render if passkeys not supported',
        (WidgetTester tester) async {
      when(() => derivPasskeysBloc.state).thenReturn(
        DerivPasskeysNotSupportedState(),
      );
      await tester.pumpWidget(
        BlocProvider<DerivPasskeysBloc>(
          create: (BuildContext context) => derivPasskeysBloc,
          child: const _TestPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(InkWell), findsNothing);
      expect(find.byType(SvgPicture), findsNothing);
      expect(find.text('Biometrics'), findsNothing);
    });

    // if you want to test the onPressed callback, you can use the following code
    testWidgets('should call DerivPasskeysVerifyCredentialEvent when pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider<DerivPasskeysBloc>(
          create: (BuildContext context) => derivPasskeysBloc,
          child: const _TestPage(),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      verify(() => derivPasskeysBloc.add(DerivPasskeysVerifyCredentialEvent()))
          .called(1);
    });

    testWidgets(
        'should show alert dialog when NoCredentialErrorState is emitted',
        (WidgetTester tester) async {
      whenListen(
          derivPasskeysBloc,
          Stream<DerivPasskeysState>.fromIterable(
              <DerivPasskeysState>[const NoCredentialErrorState()]));
      await tester.pumpWidget(
        BlocProvider<DerivPasskeysBloc>(
          create: (BuildContext context) => derivPasskeysBloc,
          child: const _TestPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text(DerivPasskeysLocalizationsEn().noPasskeyFound),
          findsOneWidget);
      expect(
          find.text(DerivPasskeysLocalizationsEn().noPasskeyFoundDescription),
          findsOneWidget);
      expect(find.text(DerivPasskeysLocalizationsEn().ok.toUpperCase()),
          findsOneWidget);

      await tester
          .tap(find.text(DerivPasskeysLocalizationsEn().ok.toUpperCase()));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets(
        'should show alert dialog with error message when DerivPasskeysErrorState is emitted with errorCode PASSKEYS_SERVICE_ERROR',
        (WidgetTester tester) async {
      whenListen(
          derivPasskeysBloc,
          Stream<DerivPasskeysState>.fromIterable(<DerivPasskeysState>[
            const DerivPasskeysErrorState(
              'error_message',
              errorCode: 'PASSKEYS_SERVICE_ERROR',
            )
          ]));
      await tester.pumpWidget(
        BlocProvider<DerivPasskeysBloc>(
          create: (BuildContext context) => derivPasskeysBloc,
          child: const _TestPage(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text(DerivPasskeysLocalizationsEn().unexpectedError),
          findsOneWidget);
      expect(find.text('error_message'), findsOneWidget);
      expect(find.text(DerivPasskeysLocalizationsEn().ok.toUpperCase()),
          findsOneWidget);

      await tester
          .tap(find.text(DerivPasskeysLocalizationsEn().ok.toUpperCase()));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
