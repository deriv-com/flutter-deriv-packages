import 'dart:async';

import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_theme/src/theme_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  late final StreamController<Brightness> brightnessController;

  setUpAll(() {
    brightnessController = StreamController<Brightness>();
  });

  tearDownAll(() {
    brightnessController.close();
  });

  testWidgets('ThemeProvider provides correct theme for light brightness',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ThemeProvider(
        brightness: Brightness.light,
        child: Builder(
          builder: (BuildContext context) => Container(
            height: 100,
            width: 100,
            color: ThemeProvider.of(context).prominent,
          ),
        ),
      ),
    );

    final Container container =
        tester.widget<Container>(find.byType(Container).first);

    expect(container.color, DerivLightColors.prominent);
  });

  testWidgets('ThemeProvider provides correct theme for dark brightness',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ThemeProvider(
        brightness: Brightness.dark,
        child: Builder(
          builder: (BuildContext context) => Container(
            height: 100,
            width: 100,
            color: ThemeProvider.of(context).prominent,
          ),
        ),
      ),
    );

    final Container container =
        tester.widget<Container>(find.byType(Container).first);

    expect(container.color, DerivDarkColors.prominent);
  });

  testWidgets('ThemeProvider updates theme when brightness changes',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      StreamBuilder<Brightness>(
        stream: brightnessController.stream,
        builder: (BuildContext context, AsyncSnapshot<Brightness> snapshot) =>
            ThemeProvider(
          brightness: snapshot.data ?? Brightness.light,
          child: Builder(
            builder: (BuildContext context) => Container(
              height: 100,
              width: 100,
              color: ThemeProvider.of(context).prominent,
            ),
          ),
        ),
      ),
    );

    Container container =
        tester.widget<Container>(find.byType(Container).first);

    expect(container.color, DerivLightColors.prominent);

    brightnessController.add(Brightness.dark);
    await tester.pumpAndSettle();

    container = tester.widget<Container>(find.byType(Container).first);

    expect(container.color, DerivDarkColors.prominent);
  });
}
