import 'package:deriv_theme/deriv_theme_provider.dart';
import 'package:deriv_theme/theme_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('DerivThemeProvider provides the correct initial theme mode',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      DerivThemeProvider(
        initialTheme: ThemeMode.light,
        child: Builder(
          builder: (BuildContext context) => Container(
            height: 100,
            width: 100,
            color: DerivThemeProvider.getTheme(context).colors.prominent,
          ),
        ),
      ),
    );

    final Container container =
        tester.widget<Container>(find.byType(Container).first);

    expect(container.color,
        const ThemeProvider(Brightness.light).colors.prominent);
  });

  testWidgets('DerivThemeProvider changes the theme mode',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      DerivThemeProvider(
        initialTheme: ThemeMode.light,
        child: Builder(
          builder: (BuildContext context) => GestureDetector(
            onTap: () =>
                DerivThemeProvider.changeThemeMode(context, ThemeMode.dark),
            child: Container(
              height: 100,
              width: 100,
              color: DerivThemeProvider.getTheme(context).colors.prominent,
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    final Container container =
        tester.widget<Container>(find.byType(Container).first);

    expect(
        container.color, const ThemeProvider(Brightness.dark).colors.prominent);
  });

  testWidgets(
      'DerivThemeProvider updates the theme mode when system brightness changes',
      (WidgetTester tester) async {
    tester.binding.window.platformBrightnessTestValue = Brightness.light;

    await tester.pumpWidget(
      DerivThemeProvider(
        initialTheme: ThemeMode.system,
        child: Builder(
          builder: (BuildContext context) => Container(
            height: 100,
            width: 100,
            color: DerivThemeProvider.getTheme(context).colors.prominent,
          ),
        ),
      ),
    );

    Container container =
        tester.widget<Container>(find.byType(Container).first);

    expect(container.color,
        const ThemeProvider(Brightness.light).colors.prominent);

    tester.binding.window.platformBrightnessTestValue = Brightness.dark;
    await tester.pumpAndSettle();

    container = tester.widget<Container>(find.byType(Container).first);

    expect(
        container.color, const ThemeProvider(Brightness.dark).colors.prominent);
  });
}
