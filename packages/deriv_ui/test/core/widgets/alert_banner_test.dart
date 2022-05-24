import 'package:deriv_ui/core/widgets/alert_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late String testContent;
  late String firstActionLabel;
  late String secondActionLabel;

  setUpAll(() {
    testContent =
        'Your account has been blocked. You may only view the chart or close '
        'open positions. To enable trading and deposits, please contact '
        'our Customer Support team.';
    firstActionLabel = 'dismiss';
    secondActionLabel = 'contact support';
  });

  group('Alert banner widget tests =>', () {
    testWidgets(
        'Should show an alert banner with content and one action button.',
        (WidgetTester tester) async {
      final AlertBanner alertBanner = AlertBanner(
        content: testContent,
        positiveButtonLabel: firstActionLabel,
        onPositiveActionPressed: () {},
      );

      await tester.pumpWidget(_AlertBannerTest(alertBanner));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text(testContent), findsOneWidget);
      expect(find.text(firstActionLabel.toUpperCase()), findsOneWidget);
    });

    testWidgets(
        'Should show an alert banner with content and 2 action buttons.',
        (WidgetTester tester) async {
      final AlertBanner alertBanner = AlertBanner(
        content: testContent,
        positiveButtonLabel: firstActionLabel,
        negativeButtonLabel: secondActionLabel,
        onPositiveActionPressed: () {},
      );

      await tester.pumpWidget(_AlertBannerTest(alertBanner));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text(testContent), findsOneWidget);
      expect(find.text(firstActionLabel.toUpperCase()), findsOneWidget);
      expect(find.text(secondActionLabel.toUpperCase()), findsOneWidget);
    });

    testWidgets('Should notify when positive action is clicked.',
        (WidgetTester tester) async {
      bool isActionClicked = false;
      final AlertBanner alertBanner = AlertBanner(
        content: testContent,
        positiveButtonLabel: firstActionLabel,
        onPositiveActionPressed: () => isActionClicked = true,
      );

      await tester.pumpWidget(_AlertBannerTest(alertBanner));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      await tester.tap(find.text(firstActionLabel.toUpperCase()));
      await tester.pump();

      expect(isActionClicked, isTrue);
    });

    testWidgets('Should notify when negative action is clicked.',
        (WidgetTester tester) async {
      bool isActionClicked = false;
      final AlertBanner alertBanner = AlertBanner(
        content: testContent,
        positiveButtonLabel: firstActionLabel,
        negativeButtonLabel: secondActionLabel,
        onPositiveActionPressed: () {},
        onNegativeActionPressed: () => isActionClicked = true,
      );

      await tester.pumpWidget(_AlertBannerTest(alertBanner));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      await tester.tap(find.text(secondActionLabel.toUpperCase()));
      await tester.pump();

      expect(isActionClicked, isTrue);
    });
  });
}

class _AlertBannerTest extends StatefulWidget {
  const _AlertBannerTest(this.alertBanner);

  final AlertBanner alertBanner;

  @override
  _AlertBannerState createState() => _AlertBannerState();
}

class _AlertBannerState extends State<_AlertBannerTest> {
  bool _shouldShowBanner = false;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) => Column(
              children: <Widget>[
                if (_shouldShowBanner) widget.alertBanner,
                ElevatedButton(
                  child: const Text('X'),
                  onPressed: () {
                    setState(() => _shouldShowBanner = true);
                  },
                )
              ],
            ),
          ),
        ),
      );
}
