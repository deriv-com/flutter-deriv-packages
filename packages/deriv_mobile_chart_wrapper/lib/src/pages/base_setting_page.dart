import 'package:deriv_chart/deriv_chart.dart';

abstract class BaseIndicatorSettingPage<T extends IndicatorConfig> {
  BaseIndicatorSettingPage(
      {required this.initialConfig, required this.onConfigUpdated});

  T initialConfig;

  void Function(T config) onConfigUpdated;
}
