import 'package:deriv_passkeys/src/presentation/widgets/section_title_and_content.dart';
import 'package:deriv_passkeys/src/presentation/widgets/unordered_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deriv_passkeys/src/presentation/pages/learn_more_passkeys_page.dart';

void main() {
  group('LearnMorePasskeysPage', () {
    testWidgets('renders page correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LearnMorePasskeysPage(),
        ),
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
        const MaterialApp(
          home: LearnMorePasskeysPage(),
        ),
      );

      // Verify that the page displays the correct text
      expect(find.text('Effortless login with passkeys'), findsOneWidget);
      expect(find.text('What are passkeys?'), findsOneWidget);
      expect(find.text('Why passkeys?'), findsOneWidget);
      expect(find.text('How to create a passkey?'), findsOneWidget);
      expect(find.text('Where are passkeys saved?'), findsOneWidget);
      expect(find.text('What happens if my Deriv account email is changed?'),
          findsOneWidget);
      expect(find.text('Tips:'), findsOneWidget);
      expect(find.text('Before using passkeys:'), findsOneWidget);
      expect(find.text('Enable screen lock on your device.'), findsOneWidget);
      expect(find.text('Sign in to your Google or iCloud account.'),
          findsOneWidget);
      expect(find.text('Enable Bluetooth.'), findsOneWidget);
    });
  });
}
