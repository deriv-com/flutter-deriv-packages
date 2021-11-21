import 'package:deriv_theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_theme/text_styles.dart';
import 'package:deriv_theme/src/colors.dart';

ValueKey<String> key = const ValueKey<String>('ok');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeProviderTest', () {
    final ThemeProvider themeProviderTest = ThemeProvider();

    group('getStyleTest()', () {
      test('pass all arguments correctly', () {
        themeProviderTest.getStyle(
          textStyle: TextStyles.captionBold,
          color: DarkThemeColors.base08,
        );
      });

      test('getStyle() returns a TextStyle', () {
        const TextStyle resultStyle = TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'IBMPlexSans',
            fontSize: 34,
            fontWeight: FontWeight.w400,
            height: 1.5);

        final TextStyle style = themeProviderTest.getStyle(
          textStyle: TextStyles.display1,
          color: DarkThemeColors.base01,
        );

        expect(style, equals(resultStyle));
      });
    });

    group('textStyleTest()', () {
      test('pass arguments correctly', () {
        themeProviderTest.getStyle(
          textStyle: TextStyles.display1,
          color: DarkThemeColors.base02,
        );
      });

      test('textStyle() returns a TextStyle', () {
        const TextStyle resultStyle = TextStyle(
            color: Color(0xFFEAECED),
            fontFamily: 'IBMPlexSans',
            fontSize: 34,
            fontWeight: FontWeight.w400,
            height: 1.5);

        final TextStyle style = themeProviderTest.getStyle(
          textStyle: TextStyles.display1,
          color: DarkThemeColors.base02,
        );

        expect(style, equals(resultStyle));
      });

      test('accepts no color', () {
        themeProviderTest.textStyle(
          textStyle: TextStyles.display1,
        );
      });

      test('accepts null color', () {
        themeProviderTest.textStyle(textStyle: TextStyles.display1);
      });

      test('accepts color', () {
        themeProviderTest.getStyle(
          textStyle: TextStyles.display1,
          color: DarkThemeColors.base01,
        );
      });
    });

    group('updateThemeTest()', () {
      test('_isDarkTheme changes based on brightness value', () {
        themeProviderTest.updateTheme(brightness: Brightness.dark);
        expect(themeProviderTest.isDarkTheme, isTrue);

        themeProviderTest.updateTheme(brightness: Brightness.light);
        expect(themeProviderTest.isDarkTheme, isFalse);
      });
    });
  });
}
