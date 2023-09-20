import 'package:flutter/material.dart';
import 'package:patrol/patrol.dart';

import 'base_test_app.dart';

extension PumpApp on PatrolTester {
  Future<void> pumpApp(Widget widget, {bool settle = true}) => settle
      ? pumpWidgetAndSettle(
          BaseTestApp(
            child: widget,
          ),
        )
      : pumpWidget(
          BaseTestApp(
            child: widget,
          ),
        );
}
