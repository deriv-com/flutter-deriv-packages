import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  group('PictureBadge', () {
    testWidgets('displays both icon and badge', (WidgetTester tester) async {
      
      final SvgPicture icon = SvgPicture.asset('assets/icons/icon.svg');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PictureBadge(
              icon: icon,
              badge: icon,
            ),
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsNWidgets(2));
    });

    testWidgets('renders icon and badge at the correct positions', (WidgetTester tester) async {
      final SvgPicture icon = SvgPicture.asset('assets/icons/icon.svg');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PictureBadge(
              icon: icon,
              badge: icon,
            ),
          ),
        ),
      );

      final Finder iconFinder = find.byWidget(icon);

      expect(iconFinder, findsNWidgets(2));
    });
  });
}
