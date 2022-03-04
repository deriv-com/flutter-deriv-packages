import 'package:deriv_ui/core/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const int badgeCountValue = 2;
  const double childWidgetPadding = 10;
  const double countLabelContainerHeight = 30;
  const double countLabelContainerWidth = 80;
  const double noShowDotMinHeight = 5;
  const double noShowDotMinWidth = 5;
  const double showDotMinHeight = 10;
  const double showDotMinWidth = 10;
  const double notificationBadgeBorderWidth = 3;
  const String semanticLabel = 'Test';
  const Color notificationBadgeBackgroundColor = Colors.blueGrey;
  const TextStyle countLabelTextStyle = TextStyle(color: Colors.white);

  group('Badge widget tests', () {
    testWidgets(
        'Badge widget should contain a text when badgeCount is not null',
        (WidgetTester tester) async {
      const Badge badge = Badge(
        count: badgeCountValue,
        childWidgetPadding: childWidgetPadding,
        countLabelContainerHeight: countLabelContainerHeight,
        countLabelContainerWidth: countLabelContainerWidth,
        countLabelTextStyle: countLabelTextStyle,
        noShowDotMinHeight: noShowDotMinHeight,
        noShowDotMinWidth: noShowDotMinWidth,
        notificationBadgeBackgroundColor: notificationBadgeBackgroundColor,
        notificationBadgeBorderWidth: notificationBadgeBorderWidth,
        semanticLabel: semanticLabel,
        showDotMinHeight: showDotMinHeight,
        showDotMinWidth: showDotMinWidth,
      );

      await tester.pumpWidget(const _TestApp(badge));

      await tester.idle();
      await tester.pumpAndSettle();

      expect(badge.enabled, isTrue);
      expect(find.text('$badgeCountValue'), findsOneWidget);
    });

    testWidgets(
        'Badge widget should not contain any text when badgeCount is null',
        (WidgetTester tester) async {
      const Badge badge = Badge(
        childWidgetPadding: childWidgetPadding,
        countLabelContainerHeight: countLabelContainerHeight,
        countLabelContainerWidth: countLabelContainerWidth,
        countLabelTextStyle: countLabelTextStyle,
        noShowDotMinHeight: noShowDotMinHeight,
        noShowDotMinWidth: noShowDotMinWidth,
        notificationBadgeBackgroundColor: notificationBadgeBackgroundColor,
        notificationBadgeBorderWidth: notificationBadgeBorderWidth,
        semanticLabel: semanticLabel,
        showDotMinHeight: showDotMinHeight,
        showDotMinWidth: showDotMinWidth,
      );

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
        childWidgetPadding: childWidgetPadding,
        countLabelContainerHeight: countLabelContainerHeight,
        countLabelContainerWidth: countLabelContainerWidth,
        countLabelTextStyle: countLabelTextStyle,
        noShowDotMinHeight: noShowDotMinHeight,
        noShowDotMinWidth: noShowDotMinWidth,
        notificationBadgeBackgroundColor: notificationBadgeBackgroundColor,
        notificationBadgeBorderWidth: notificationBadgeBorderWidth,
        semanticLabel: semanticLabel,
        showDotMinHeight: showDotMinHeight,
        showDotMinWidth: showDotMinWidth,
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
        childWidgetPadding: childWidgetPadding,
        countLabelContainerHeight: countLabelContainerHeight,
        countLabelContainerWidth: countLabelContainerWidth,
        countLabelTextStyle: countLabelTextStyle,
        noShowDotMinHeight: noShowDotMinHeight,
        noShowDotMinWidth: noShowDotMinWidth,
        notificationBadgeBackgroundColor: notificationBadgeBackgroundColor,
        notificationBadgeBorderWidth: notificationBadgeBorderWidth,
        semanticLabel: semanticLabel,
        showDotMinHeight: showDotMinHeight,
        showDotMinWidth: showDotMinWidth,
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
      const Badge badge = Badge(
        child: Text('Badge Label'),
        count: badgeCount,
        childWidgetPadding: childWidgetPadding,
        countLabelContainerHeight: countLabelContainerHeight,
        countLabelContainerWidth: countLabelContainerWidth,
        countLabelTextStyle: countLabelTextStyle,
        noShowDotMinHeight: noShowDotMinHeight,
        noShowDotMinWidth: noShowDotMinWidth,
        notificationBadgeBackgroundColor: notificationBadgeBackgroundColor,
        notificationBadgeBorderWidth: notificationBadgeBorderWidth,
        semanticLabel: semanticLabel,
        showDotMinHeight: showDotMinHeight,
        showDotMinWidth: showDotMinWidth,
      );

      await tester.pumpWidget(const _TestApp(badge));

      await tester.idle();
      await tester.pumpAndSettle();

      final Finder badgeIconFinder = find.bySemanticsLabel(
        'Badge Label',
      );

      expect(badgeIconFinder, findsOneWidget);
    });

    testWidgets('Badge widget child should have a badge with badgeCount label',
        (WidgetTester tester) async {
      const int badgeCount = 3;
      const Badge badge = Badge(
        child: Text('Badge Label'),
        count: badgeCount,
        childWidgetPadding: childWidgetPadding,
        countLabelContainerHeight: countLabelContainerHeight,
        countLabelContainerWidth: countLabelContainerWidth,
        countLabelTextStyle: countLabelTextStyle,
        noShowDotMinHeight: noShowDotMinHeight,
        noShowDotMinWidth: noShowDotMinWidth,
        notificationBadgeBackgroundColor: notificationBadgeBackgroundColor,
        notificationBadgeBorderWidth: notificationBadgeBorderWidth,
        semanticLabel: semanticLabel,
        showDotMinHeight: showDotMinHeight,
        showDotMinWidth: showDotMinWidth,
      );

      await tester.pumpWidget(const _TestApp(badge));

      await tester.idle();
      await tester.pumpAndSettle();

      final Finder badgeIconFinder = find.text(
        '3',
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
        home: badge,
      );
}
