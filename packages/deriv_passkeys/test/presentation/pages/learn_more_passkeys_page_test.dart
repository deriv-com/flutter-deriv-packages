import 'package:deriv_localizations/l10n/generated/deriv_passkeys/deriv_passkeys_localizations.dart';
import 'package:deriv_localizations/l10n/generated/deriv_passkeys/deriv_passkeys_localizations_en.dart';
import 'package:deriv_passkeys/src/presentation/widgets/section_title_and_content.dart';
import 'package:deriv_passkeys/src/presentation/widgets/unordered_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deriv_passkeys/src/presentation/pages/learn_more_passkeys_page.dart';

class _TestPage extends StatelessWidget {
  const _TestPage();

  @override
  Widget build(BuildContext context) => const MaterialApp(
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          DerivPasskeysLocalizations.delegate,
        ],
        locale: Locale('en'),
        home: LearnMorePasskeysPage(),
      );
}

void main() {
  group('LearnMorePasskeysPage', () {
    testWidgets('renders page correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const _TestPage(),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(SvgPicture), findsNWidgets(2));
      expect(find.byType(SectionTitleAndContent), findsNWidgets(5));
      expect(find.byType(Divider), findsNWidgets(4));
      expect(find.byType(UnorderedList), findsOneWidget);
    });

    testWidgets('displays correct text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const _TestPage(),
      );

      // Verify that the page displays the correct text
      expect(find.text(DerivPasskeysLocalizationsEn().effortlessLogin),
          findsOneWidget);
      expect(find.text(DerivPasskeysLocalizationsEn().whatArePasskeys),
          findsOneWidget);
      expect(find.text(DerivPasskeysLocalizationsEn().whyPasskeys),
          findsOneWidget);
      expect(find.text(DerivPasskeysLocalizationsEn().howToCreatePasskey),
          findsOneWidget);
      expect(find.text(DerivPasskeysLocalizationsEn().whereArePasskeysSaved),
          findsOneWidget);
      expect(
          find.text(DerivPasskeysLocalizationsEn().whatHappensIfEmailChanged),
          findsOneWidget);
      expect(find.textContaining(DerivPasskeysLocalizationsEn().tips),
          findsOneWidget);
      expect(
          find.textContaining(
              DerivPasskeysLocalizationsEn().beforeUsingPasskeys),
          findsOneWidget);
      expect(
          find.textContaining(DerivPasskeysLocalizationsEn().enableScreenLock),
          findsOneWidget);
      expect(
          find.textContaining(
              DerivPasskeysLocalizationsEn().signInGoogleOrIcloud),
          findsOneWidget);
      expect(
          find.textContaining(DerivPasskeysLocalizationsEn().enableBluetooth),
          findsOneWidget);
    });
  });
}
