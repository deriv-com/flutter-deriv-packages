import 'package:deriv_ui/models/custom_icon_data_model.dart';
import 'package:deriv_ui/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomImage', () {
    testWidgets('renders SVG asset correctly when icon data contains `.svg`',
        (WidgetTester tester) async {
      final CustomIconData iconData =
          CustomIconData(icon: 'assets/icons/icon.svg', width: 24, height: 24);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomImage(
              iconData: iconData,
              semanticLabel: 'Icon',
            ),
          ),
        ),
      );

      final Finder svgPictureFinder = find.byType(SvgPicture);
      final Finder imageFinder = find.byType(Image);

      expect(svgPictureFinder, findsOneWidget);
      expect(imageFinder, findsNothing);

      final SvgPicture svgPicture = tester.widget<SvgPicture>(svgPictureFinder);

      expect(svgPicture.width, 24);
      expect(svgPicture.height, 24);
      expect(svgPicture.semanticsLabel, 'Icon');
    });

    testWidgets(
        'renders image asset correctly when icon data does not contain `.svg`',
        (WidgetTester tester) async {
      final CustomIconData iconData = CustomIconData(
          icon: 'assets/icons/test_icon.jpg', width: 24, height: 24);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomImage(
              iconData: iconData,
              semanticLabel: 'Icon',
            ),
          ),
        ),
      );

      final Finder svgPictureFinder = find.byType(SvgPicture);
      final Finder imageFinder = find.byType(Image);

      expect(svgPictureFinder, findsNothing);
      expect(imageFinder, findsOneWidget);

      final Image image = tester.widget<Image>(imageFinder);

      expect(image.width, 24);
      expect(image.height, 24);
      expect(image.semanticLabel, 'Icon');
    });
  });
}
