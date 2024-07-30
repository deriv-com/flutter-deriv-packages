import 'package:deriv_chart/deriv_chart.dart';
import 'package:flutter/material.dart';

/// The base class for the indicator setting page.
abstract class BaseIndicatorSettingPage<T extends IndicatorConfig>
    extends StatefulWidget {
  /// Initializes the indicator setting page.
  const BaseIndicatorSettingPage(
      {super.key, required this.initialConfig, required this.onConfigUpdated});

  /// The initial configuration of the indicator.
  final T initialConfig;

  /// The callback function to be called when the configuration is updated.
  final void Function(T config) onConfigUpdated;
}
