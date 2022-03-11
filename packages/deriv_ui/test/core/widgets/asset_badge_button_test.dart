import 'package:deriv_ui/core/assets.dart';
import 'package:deriv_ui/core/widgets/asset_badge_button.dart';
import 'package:deriv_ui/util/strings_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Asset Badge Button Test =>', () {
    testWidgets('asset badge button should have a badge with an icon.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AssetBadgeButton(
              badgeAssetName: positionsBadgeIndicatorIcon,
              iconAssetName: positionsIcon,
              semanticLabel: semanticBadgeIcon,
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      final Finder badgeIconFinder = find.bySemanticsLabel(semanticBadgeIcon);

      final Finder badgeIndicatorIconFinder =
          find.bySemanticsLabel(semanticBadgeIndicatorIcon);

      expect(badgeIconFinder, findsOneWidget);
      expect(badgeIndicatorIconFinder, findsOneWidget);
    });

    testWidgets(
        'Asset badge button should not have a badge with badge indicator.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AssetBadgeButton(
              iconAssetName: positionsIcon,
              badgeAssetName: null,
              semanticLabel: semanticBadgeIcon,
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      final Finder badgeIconFinder = find.bySemanticsLabel(semanticBadgeIcon);

      final Finder badgeIndicatorIconFinder =
          find.bySemanticsLabel(semanticBadgeIndicatorIcon);

      expect(badgeIconFinder, findsOneWidget);
      expect(badgeIndicatorIconFinder, findsNothing);
    });

    testWidgets('Asset badge button on pressed test.',
        (WidgetTester tester) async {
      int counter = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AssetBadgeButton(
              badgeAssetName: positionsBadgeIndicatorIcon,
              iconAssetName: positionsIcon,
              semanticLabel: semanticBadgeIcon,
              onPressed: () => counter++,
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      final Finder badgeIconFinder = find.bySemanticsLabel(semanticBadgeIcon);

      final Finder badgeIndicatorIconFinder =
          find.bySemanticsLabel(semanticBadgeIndicatorIcon);

      expect(badgeIconFinder, findsOneWidget);
      expect(badgeIndicatorIconFinder, findsOneWidget);

      await tester.tap(find.byType(AssetBadgeButton));
      await tester.pump();

      expect(counter, 1);
    });
  });
}
