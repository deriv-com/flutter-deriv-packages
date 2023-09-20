import 'package:deriv_ui/models/custom_icon_data_model.dart';
import 'package:deriv_ui/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FullscreenMessage', () {
    late CustomIconData iconData;

    setUpAll(() {
      iconData = CustomIconData(icon: 'assets/icons/icon.svg');
    });

    testWidgets('renders correctly with title and description',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FullscreenMessage(
              iconData: iconData,
              iconSemanticLabel: 'Icon',
              title: 'Title',
              description: 'Description',
            ),
          ),
        ),
      );

      final Finder appSettingGestureDetectorFinder =
          find.byType(AppSettingGestureDetector);
      final Finder customImageFinder = find.byType(CustomImage);
      final Finder titleFinder = find.text('Title');

      expect(appSettingGestureDetectorFinder, findsOneWidget);
      expect(customImageFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);

      final AppSettingGestureDetector appSettingGestureDetector = tester
          .widget<AppSettingGestureDetector>(appSettingGestureDetectorFinder);

      expect(appSettingGestureDetector.child, isA<CustomImage>());
      expect(appSettingGestureDetector.enable, false);

      final CustomImage customImage =
          tester.widget<CustomImage>(customImageFinder);

      expect(customImage.iconData, iconData);
      expect(customImage.semanticLabel, 'Icon');
    });

    testWidgets('renders correctly with titleWidget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FullscreenMessage(
              iconData: iconData,
              iconSemanticLabel: 'Icon',
              titleWidget: const Text('Title Widget'),
            ),
          ),
        ),
      );

      final Finder titleWidgetFinder = find.text('Title Widget');

      expect(titleWidgetFinder, findsOneWidget);
    });

    testWidgets('shouldShowLoadingIndicator', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FullscreenMessage(shouldShowLoadingIndicator: true),
          ),
        ),
      );

      final Finder loadingIndicatorFinder = find.byType(LoadingIndicator);

      expect(loadingIndicatorFinder, findsOneWidget);
    });

    testWidgets('isActionButtonVisible', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FullscreenMessage(actionLabel: 'Action Label'),
          ),
        ),
      );

      final Finder actionLabelFinder = find.text('Action Label'.toUpperCase());

      expect(actionLabelFinder, findsOneWidget);
    });
  });
}
