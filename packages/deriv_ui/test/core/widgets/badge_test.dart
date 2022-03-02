import 'package:deriv_ui/core/widgets/badge.dart';
import 'package:deriv_ui/util/strings_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const int badgeCountValue = 2;

  group('Badge widget tests', () {
    // late S localization;
    //
    // setUpAll(() => localization = S());

    testWidgets(
        'Badge widget should contain a text when badgeCount is not null',
        (WidgetTester tester) async {
      const Badge badge = Badge(count: badgeCountValue);

      await tester.pumpWidget(const _TestApp(badge));

      await tester.idle();
      await tester.pumpAndSettle();

      expect(badge.enabled, isTrue);
      expect(find.text('${badgeCountValue.toString()}'), findsOneWidget);
    });

    testWidgets(
        'Badge widget should not contain any text when badgeCount is null',
        (WidgetTester tester) async {
      const Badge badge = Badge();

      await tester.pumpWidget(const _TestApp(badge));

      await tester.idle();
      await tester.pumpAndSettle();

      expect(badge.enabled, isTrue);
      expect(find.text('$badgeCountValue'), findsNothing);
    });

    testWidgets('Badge widget should not be visible when badgeEnabled is false',
        (WidgetTester tester) async {
      const Badge badge = Badge(
        count: badgeCountValue,
        enabled: false,
      );

      await tester.pumpWidget(const _TestApp(badge));

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.text('$badgeCountValue'), findsNothing);
    });

    testWidgets(
        'Badge widget child should be visible when child parameter is assigned',
        (WidgetTester tester) async {
      final Badge badge = Badge(
        child: ElevatedButton(child: const SizedBox(), onPressed: () {}),
      );

      await tester.pumpWidget(_TestApp(badge));

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets(
        'Badge widget child should have a badge with `one notification` label',
        (WidgetTester tester) async {
      const int badgeCount = 1;
      const Badge badge = Badge(child: Text('Badge Label'), count: badgeCount);

      await tester.pumpWidget(const _TestApp(badge));

      await tester.idle();
      await tester.pumpAndSettle();

      final Finder badgeIconFinder = find.bySemanticsLabel(
        semanticNotificationCountIcon,
      );

      expect(badgeIconFinder, findsOneWidget);
    });

    testWidgets('Badge widget child should have a badge with badgeCount label',
        (WidgetTester tester) async {
      const int badgeCount = 3;
      const Badge badge = Badge(child: Text('Badge Label'), count: badgeCount);

      await tester.pumpWidget(const _TestApp(badge));

      await tester.idle();
      await tester.pumpAndSettle();

      final Finder badgeIconFinder = find.bySemanticsLabel(
        semanticNotificationsCountIcon(badgeCount),
      );

      expect(badgeIconFinder, findsOneWidget);
    });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp(this.badge);

  final Badge badge;

  @override
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          // S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // supportedLocales: S.delegate.supportedLocales,
        home: badge,
      );
}
