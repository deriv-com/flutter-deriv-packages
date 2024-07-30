import 'package:deriv_chart/deriv_chart.dart';

/// The base class for the indicator setting page.
abstract class BaseIndicatorSettingPage<T extends IndicatorConfig> {
  /// Initializes the indicator setting page.
  BaseIndicatorSettingPage(
      {required this.initialConfig, required this.onConfigUpdated});

  /// The initial configuration of the indicator.
  T initialConfig;


  /// The callback function to be called when the configuration is updated.
  void Function(T config) onConfigUpdated;
}
