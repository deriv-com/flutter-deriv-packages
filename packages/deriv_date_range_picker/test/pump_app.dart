import 'package:deriv_date_range_picker/deriv_date_range_picker.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      DerivThemeProvider(
        child: MaterialApp(
          localizationsDelegates: const [
            DateRangeLocalizations.delegate,
          ],
          supportedLocales: DateRangeLocalizations.supportedLocales,
          home: widget,
        ),
      ),
    );
  }
}
