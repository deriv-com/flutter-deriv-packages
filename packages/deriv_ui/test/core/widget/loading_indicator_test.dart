import 'package:deriv_ui/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const Color _brandCoralColor = Colors.pinkAccent;
  group(
    'LoadingIndicator widget tests',
    () {
      testWidgets(
        'Should show a circular progress indicator if no arguments passed',
        (WidgetTester tester) async {
          await tester.pumpWidget(
              const LoadingIndicator(brandCoralColor: _brandCoralColor));

          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        },
      );

      testWidgets(
        'Should show a circular progress indicator when `isCircular` argument is true',
        (WidgetTester tester) async {
          await tester.pumpWidget(
              const LoadingIndicator(brandCoralColor: _brandCoralColor));

          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        },
      );

      testWidgets(
        'Should show a linear progress indicator when `isCircular` argument is false',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const Directionality(
              textDirection: TextDirection.ltr,
              child: LoadingIndicator(
                  isCircular: false, brandCoralColor: _brandCoralColor),
            ),
          );

          expect(find.byType(LinearProgressIndicator), findsOneWidget);
        },
      );

      testWidgets(
        'Should have a transparent background color if no `backgroundColor` was passed',
        (WidgetTester tester) async {
          await tester.pumpWidget(
              const LoadingIndicator(brandCoralColor: _brandCoralColor));

          expect(
            (tester.firstWidget(find.byType(CircularProgressIndicator))
                    as CircularProgressIndicator)
                .backgroundColor,
            Colors.transparent,
          );
        },
      );

      testWidgets(
        'Should have a background color that matches the `backgroundColor` passed',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const LoadingIndicator(
                backgroundColor: Colors.teal,
                brandCoralColor: _brandCoralColor),
          );

          expect(
            (tester.firstWidget(find.byType(CircularProgressIndicator))
                    as CircularProgressIndicator)
                .backgroundColor,
            Colors.teal,
          );
        },
      );

      testWidgets(
        'Should have a [brandCoralColor] progress indicator color if no `indicatorColor` was passed',
        (WidgetTester tester) async {
          await tester.pumpWidget(
              const LoadingIndicator(brandCoralColor: _brandCoralColor));

          expect(
            (tester.firstWidget(find.byType(CircularProgressIndicator))
                    as CircularProgressIndicator)
                .valueColor!
                .value,
            const AlwaysStoppedAnimation<Color>(Colors.pinkAccent).value,
          );
        },
      );

      testWidgets(
        'Should have a progress indicator value color that matches the `valueColor` passed',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const LoadingIndicator(
                valueColor: Colors.orange, brandCoralColor: _brandCoralColor),
          );

          expect(
            (tester.firstWidget(find.byType(CircularProgressIndicator))
                    as CircularProgressIndicator)
                .valueColor!
                .value,
            const AlwaysStoppedAnimation<Color>(Colors.orange).value,
          );
        },
      );
    },
  );

  testWidgets(
    'Indeterminate LoadingIndicator() keeps spinning until end of time',
    (WidgetTester tester) async {
      await tester.pumpWidget(
          const LoadingIndicator(brandCoralColor: _brandCoralColor));
      expect(tester.hasRunningAnimations, isTrue);

      await tester.pump(const Duration(milliseconds: 700));
      expect(tester.hasRunningAnimations, isTrue);

      await tester.pump(const Duration(seconds: 2));
      expect(tester.hasRunningAnimations, isTrue);

      await tester.pump(const Duration(days: 3));
      expect(tester.hasRunningAnimations, isTrue);
    },
  );

  testWidgets(
    'Determinate LoadingIndicator() stops the animator',
    (WidgetTester tester) async {
      double? progressValue;
      late StateSetter setState;
      await tester.pumpWidget(
        Center(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setter) {
              setState = setter;

              return Directionality(
                textDirection: TextDirection.ltr,
                child: LoadingIndicator(
                    value: progressValue, brandCoralColor: _brandCoralColor),
              );
            },
          ),
        ),
      );

      expect(tester.hasRunningAnimations, isTrue);
      setState(() => progressValue = 1.0);
      await tester.pump(const Duration(milliseconds: 1));
      expect(tester.hasRunningAnimations, isFalse);

      setState(() => progressValue = null);
      await tester.pump(const Duration(milliseconds: 1));
      expect(tester.hasRunningAnimations, isTrue);
    },
  );
}
