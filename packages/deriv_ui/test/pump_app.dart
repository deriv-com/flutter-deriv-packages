import 'package:deriv_ui/deriv_ui.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) => pumpWidget(
        DerivThemeProvider(
          child: MaterialApp(
            localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              DateRangeLocalizations.delegate,
            ],
            supportedLocales: DateRangeLocalizations.supportedLocales,
            home: widget,
          ),
        ),
      );
}
