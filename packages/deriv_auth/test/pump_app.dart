import 'package:flutter/material.dart';
import 'package:patrol_finders/patrol_finders.dart';

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
