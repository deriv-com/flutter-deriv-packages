import 'package:bloc_test/bloc_test.dart';
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
  Widget build(BuildContext context) => Scaffold(
        body: ContinueWithPasskeyButton(
          derivPasskeysBloc: context.read<DerivPasskeysBloc>(),
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
          child: const MaterialApp(
            home: _TestPage(),
          ),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Passkey'), findsOneWidget);
    });

    testWidgets('does not render if passkeys not supported',
        (WidgetTester tester) async {
      when(() => derivPasskeysBloc.state).thenReturn(
        DerivPasskeysNotSupportedState(),
      );
      await tester.pumpWidget(
        BlocProvider<DerivPasskeysBloc>(
          create: (BuildContext context) => derivPasskeysBloc,
          child: const MaterialApp(
            home: _TestPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(InkWell), findsNothing);
      expect(find.byType(SvgPicture), findsNothing);
      expect(find.text('Passkey'), findsNothing);
    });

    // if you want to test the onPressed callback, you can use the following code
    testWidgets('should call DerivPasskeysVerifyCredentialEvent when pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider<DerivPasskeysBloc>(
          create: (BuildContext context) => derivPasskeysBloc,
          child: const MaterialApp(
            home: _TestPage(),
          ),
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
          child: const MaterialApp(
            home: _TestPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('No passkey found!'), findsOneWidget);
      expect(find.text('Please create a passkey to use this feature.'),
          findsOneWidget);
      expect(find.text('OK'), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets(
        'should show alert dialog when DerivPasskeysErrorState is emitted',
        (WidgetTester tester) async {
      whenListen(
          derivPasskeysBloc,
          Stream<DerivPasskeysState>.fromIterable(<DerivPasskeysState>[
            const DerivPasskeysErrorState('unexpected_error')
          ]));
      await tester.pumpWidget(
        BlocProvider<DerivPasskeysBloc>(
          create: (BuildContext context) => derivPasskeysBloc,
          child: const MaterialApp(
            home: _TestPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('An unexpected error occurred!'), findsOneWidget);
      expect(find.text('Please try again later.'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);

      await tester.tap(find.text('OK'));
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
          child: const MaterialApp(
            home: _TestPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('An unexpected error occurred!'), findsOneWidget);
      expect(find.text('error_message'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
